using Images, TestImages, LinearAlgebra

img0 = float.(testimage("mandrill")) # load the image (512,512) matrix
img  = Gray.(img0)                   # convert to grayscale

function rank_approx(F::SVD, k)
      U, S, V = F
      M       = U[:, 1:k] * Diagonal(S[1:k]) * V[:, 1:k]'
      clamp01!(M)
end

# imgs = map((10, 50, 100)) do k
#       rank_approx(svd(img), k)  # svd(img) returns SVD{Float32, Float32, Matrix{Float32}}
# end

imgs=[ rank_approx(svd(img), k)  for k in (10,50,100)]

imgs = mosaicview(img, imgs...; nrow=1, npad=10)
save("compression-svd.png",imgs)
