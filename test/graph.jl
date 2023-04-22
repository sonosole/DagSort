using DagSort


"""
                      ┌───┐
               ┌──────┤ A ├──────┐
               │      └─┬─┘      │
               ▼        ▼        ▼
    ┌───┐    ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
    │ E ├─◄──┤ D ├─◄──┤ C ├─◄──┤ B │
    └───┘    └─┬─┘    └─┬─┘    └─┬─┘
               ▼        ▼        ▼
             ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
             │ H │    │ G │    │ F │
             └───┘    └───┘    └───┘
"""
function poolgraph()
    A = Cell("A");
    B = Cell("B");
    C = Cell("C");
    D = Cell("D");
    E = Cell("E");
    F = Cell("F");
    G = Cell("G");
    H = Cell("H");

    addkid(A, B);addkid(A, C);addkid(A, D);
    addkid(B, C);addkid(B, F);
    addkid(C, D);addkid(C, G);
    addkid(D, E);addkid(D, H);

    return A
end


"""
             ┌───┐    ┌───┐    ┌───┐
             │ C │    │ B │    │ A │
             └─┬─┘    └─┬─┘    └─┬─┘
               ▼        ▼        ▼
    ┌───┐    ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
    │ G ├─◄──┤ F ├─◄──┤ E ├─◄──┤ D │
    └───┘    └─┬─┘    └─┬─┘    └─┬─┘
               ▼        ▼        ▼
             ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
             │ J │    │ I │    │ H │
             └───┘    └───┘    └───┘
"""
function multihead()
    A = Cell("A");
    B = Cell("B");
    C = Cell("C");
    D = Cell("D");
    E = Cell("E");
    F = Cell("F");
    G = Cell("G");
    H = Cell("H");
    I = Cell("I");
    J = Cell("J");

    addkid(A, D);
    addkid(B, E);
    addkid(C, F);
    addkid(D, E);addkid(D, H);
    addkid(E, F);addkid(E, I);
    addkid(F, G);addkid(F, J);
    return A,B,C
end


"""
              ┌───┐
       ┌──────┤ A ├──────┐      top
       │      └─┬─┘      │
       ▼        ▼        ▼      n
     ┌─┴─┐    ┌─┴─┐    ┌─┴─┐    ‖
     │ D ├─◄──┤ C ├─◄──┤ B │    1
     └─┬─┘    └─┬─┘    └─┬─┘
       ▼        ▼        ▼
     ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
     │ G ├─◄──┤ F ├─◄──┤ E │    2
     └─┬─┘    └─┬─┘    └─┬─┘
       ▼        ▼        ▼
     ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
     │ J ├─◄──┤ I ├─◄──┤ H │    3
     └─┬─┘    └─┬─┘    └─┬─┘
       ▼        ▼        ▼
     ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
     │ M │─◄──│ L │─◄──│ K │    4
     └─┬─┘    └─┬─┘    └─┬─┘
       ▼        ▼        ▼
       │      ┌─┴─┐      │
       └──────┤ N ├──────┘      bot
              └───┘
  t  =  1       2        3

"""
function stgraph(N::Int, T::Int)
    top = Cell("$(N*T+1)")
    sub = Array{Cell}(undef, N, T)
    bot = Cell("0")
    for t = 1:T
        # creat spatial nodes at time `t`
        for n = 1:N
            sub[n,t] = Cell("$n-$t")
        end
        # spatial connections at time `t`
        for n = 1:N-1
            addkid(sub[n,t], sub[n+1,t])
        end
        addkid(top, sub[1,t])
    end
    # temporal connections at row `n`
    for n = 1:N
        for t = 1:T-1
            addkid(sub[n,t+1], sub[n,t])
        end
    end
    # connections to bottom node `bot`
    for t = 1:T
        addkid(sub[N,t], bot)
    end
    return top
end



"""
    A calculation graph example :
    H₃ = Z₃ + Y₃, of which Z₃ = U * H₂, Y₃ = W * X₃
    H₂ = Z₂ + Y₂, of which Z₂ = U * H₁, Y₂ = W * X₂
    H₁ = Z₁ + Y₁, of which Z₁ = U * H₀, Y₁ = W * X₁
"""
function calgraph()
    H₀ = Cell("H₀");
    H₁ = Cell("H₁");
    H₂ = Cell("H₂");
    H₃ = Cell("H₃");

    Z₁ = Cell("Z₁");
    Z₂ = Cell("Z₂");
    Z₃ = Cell("Z₃");

    Y₁ = Cell("Y₁");
    Y₂ = Cell("Y₂");
    Y₃ = Cell("Y₃");

    X₁ = Cell("X₁");
    X₂ = Cell("X₂");
    X₃ = Cell("X₃");

    U = Cell("U");
    W = Cell("W");

    addkid(H₃, Y₃);addkid(H₃, Z₃);
    addkid(H₂, Y₂);addkid(H₂, Z₂);
    addkid(H₁, Y₁);addkid(H₁, Z₁);

    addkid(Z₃, H₂);addkid(Z₃, U);
    addkid(Z₂, H₁);addkid(Z₂, U);
    addkid(Z₁, H₀);addkid(Z₁, U);

    addkid(Y₃, X₃);addkid(Y₃, W);
    addkid(Y₂, X₂);addkid(Y₂, W);
    addkid(Y₁, X₁);addkid(Y₁, W);

    return H₃
end
