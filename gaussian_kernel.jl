
abstract type Kernel end

# 分散共分散行列を生成
function cov(k::Kernel, xs1, xs2)
    # covariance matrix

    # xs1の1軸の寸法
    n1 = size(xs1, 1)

    # xs2の1軸の寸法
    n2 = size(xs2, 1)

    # 全要素0の配列
    c = zeros(n1, n2)

    # 1から寸法ぶん
    for i in 1:n1
        for j in 1:n2
            c[i,j] = ker(k, xs1[i, :], xs2[j,:])
        end
    end
    return c
end

cov(k::Kernel, xs) = cov(k, xs, xs)

"""
Gaussian Kernel
"""

mutable struct GaussianKernel <: Kernel
    theta::Float64
end

function ker(k::GaussianKernel, x1, x2)
    exp(- sum((x1 - x2).^2) / k.theta)
end
