using HTTP
using Gumbo
using Cascadia
using DataFrames
using PyCall
using Plots

# Define the URL of the Wikipedia page
url = "https://en.wikipedia.org/wiki/List_of_United_States_counties_and_county_equivalents"

url1 = "https://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)"

# Function to extract county data and create a DataFrame
function scrape_county_data(url)
    response = HTTP.get(url)
    html = String(response.body)
    parsed_html = parsehtml(html)

    # Define a CSS selector for the table of interest
    table_selector = Selector(".wikitable")

    # Use Cascadia to extract the table
    county_table = eachmatch(table_selector, parsed_html.root)

    # Extract rows from the table
    rows = eachmatch(Selector("tr"), county_table[1])
    display(length(rows))

    county_data = DataFrame(County=[], Population=[]);

    for row in rows[4:end]
        # Access and print the content of each <td> element within the <tr>
        td_elements = eachmatch(Selector("td"), row)
     
            name = Gumbo.text(td_elements[1]);
            pop  = Gumbo.text(td_elements[3]);
      
            row1 = Dict("County" => name, "Population" => pop) 
            push!(county_data, row1)          
    end

    return county_data
end

# Call the function to scrape the data
#county_data = scrape_county_data(url)
gdp_data = scrape_county_data(url1)

# Display the first few rows of the DataFrame
show(first(county_data, 5))

function benford(df)
    m,n    = size(df)
    counts = zeros(9)

    for i = 1:m
        s = string(df[i,2])
        if     s[1]=='1'
            counts[1] += 1
        elseif s[1]=='2'
            counts[2] += 1
        elseif s[1]=='3'
            counts[3] += 1
        elseif s[1]=='4'
            counts[4] += 1
        elseif s[1]=='5'
            counts[5] += 1          
        elseif s[1]=='6'
            counts[6] += 1
        elseif s[1]=='7'
            counts[7] += 1                  
        elseif s[1]=='8'
            counts[8] += 1  
        elseif s[1]=='9'
            counts[9] += 1                  
        end
    end

    counts /= m
    counts *= 100

    return counts
end


digits = [1,2,3,4,5,6,7,8,9]

counts = benford(gdp_data)

display(counts)

p = bar(digits, counts, legend=false)
title!("Luật Benford")
xlabel!("chữ số đầu")
xticks!(1:9, ["1", "2", "3","4","5","6","7","8","9"])

# Add values on top of each bar
for (i, v) in enumerate(counts)
    annotate!(i-0.1, v + 1, Plots.text(string(round(v, digits=1)), :black, :center, 10))
end

display(p)

csv_file = "sample_data.csv"

# Save the DataFrame to a CSV file
CSV.write(csv_file, county_data)
