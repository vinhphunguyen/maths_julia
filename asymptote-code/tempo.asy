\documentclass{article}
\usepackage{tikz}

\begin{document}

\begin{tikzpicture}
  % Define the number of odd numbers to sum
  \def\n{3}
  
  % Draw a square with labels
  \draw (0,0) rectangle (\n, \n);
  \node at (0.5*\n, -0.5) {$(2n-1)$};
  \node at (-0.5, 0.5*\n) {$(2n-1)$};
  
  % Fill the square with numbers
  \foreach \x in {1, 2, 3} {
    \foreach \y in {1, 2, 3} {
      \pgfmathtruncatemacro{\odd}{2*\x-1}
      \node at (\x-0.5, \y-0.5) {\odd};
    }
  }
  
  % Calculate the sum of odd numbers
  \pgfmathtruncatemacro{\sumodd}{\n*(2*\n-1)}
  
  % Label the sum
  \node at (1.5, -1) {Sum of odd numbers = $\sumodd$};
  
  % Calculate the square of the sum
  \pgfmathtruncatemacro{\squaresum}{\sumodd*\sumodd}
  
  % Label the square of the sum
  \node at (1.5, -1.5) {Square of the sum = $\squaresum$};
\end{tikzpicture}

\end{document}
