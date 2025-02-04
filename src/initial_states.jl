
function particle_in_box(ceg, nx::Int, ny::Int, nz::Int)
    @argcheck nx > 0
    @argcheck ny > 0
    @argcheck nz > 0
    r = position_operator(ceg)
    L = element_size(ceg)
    kx = nx*π/L[1]
    ky = ny*π/L[2]
    kz = nz*π/L[3]
    tmp = sin( kx*(r[1] + L[1]/2) ) * sin( ky*(r[2] + L[2]/2) ) * sin( kz*(r[3] + L[3]/2) )
    psi = QuantumState(ceg, tmp.vals)
    return normalize!(psi)
end


function atomic_orbital(ceg, Z::Real, r, n::Int, l::Int, ml::Int)
    #Z = elements[Symbol(aname)].number
    ra = austrip.(r) .* u"bohr"
    r0 = position_operator(ceg) - ra
    rr = sqrt(r0⋅r0)

    phi = exp(-0.5Z*u"bohr^-1"*rr)
    ϕ = QuantumState(ceg, phi.vals)
    return normalize!(ϕ)
end