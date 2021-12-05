# Collection of all AbstractTypes

## Elements and Grids
abstract type AbstractElement{Dims} end
abstract type AbstractElementArray{T,N} <: AbstractArray{T,N} end
abstract type AbstractElementGrid{T,N} <: AbstractArray{T,N} end
abstract type AbstractElementGridSymmetricBox <: AbstractElementGrid{SVector{3,Float64}, 6} end

## Tensor types
abstract type AbtractTransformationTensor{T} <: AbstractArray{Float64, T} end

## These are for Poisson/Helmholz equations

# These are old form and deprecated
abstract type AbstractCoulombTransformation <: AbtractTransformationTensor{5} end

# These are new
"""
    AbstractHelmholtzTensor <: AbtractTransformationTensor{5}

These types create tensors that are needed to solve Poisson/Helmholz equation.
"""
abstract type AbstractHelmholtzTensor <: AbstractCoulombTransformation end
abstract type AbstractHelmholtzTensorSingle <: AbstractHelmholtzTensor end


abstract type AbstractDerivativeTensor <: AbtractTransformationTensor{2} end

## State
abstract type AbstractQuantumState{T} <: AbstractArray{T,6} end


## Operators
abstract type AbstractOperator{N} end
abstract type AbstractScalarOperator <: AbstractOperator{1} end
abstract type AbstractVectorOperator <: AbstractOperator{3} end
abstract type AbstractCompositeOperator{N} <: AbstractOperator{N} end
abstract type AbstractHamiltonOperator <: AbstractOperator{1} end