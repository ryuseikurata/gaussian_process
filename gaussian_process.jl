using LinearAlgebra:Matrix
using LinearAlgebra
include("gaussian_kernel.jl")

"""
Gaussian Process
"""

mutable struct GaussianProcess{K <: Kernel}
    kernel::K
    eta::Float64
    # etaが観測ノイズの項目に相当し、観測値にノイズがないものとして考える場合は分散共分散行列の正則化のために対角成分に1e-6
    GaussianProcess(kernel::K) where {K <: Kernel} = new{K}(kernel, 1e-6)
    # etaが実数であった場合、Float64にキャストオフして初期化
    GaussianProcess(kernel::K, eta::Real) where {K <: Kernel} = new{K}(kernel, Float64(eta))
end

function cov(gp::GaussianProcess, xs)
    # 標準化
    n = size(xs, 1)
    cov(gp.kernel, xs) + gp.eta * Matrix{Float64}(I, n, n)
end

function dist(gp::GaussianProcess, xs)
    l = size(xs, 1)
    k = cov(gp, xs)
    MvNormal(zeros(l), k)
end
