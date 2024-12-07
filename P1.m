function P=P1(t)
    P=kron(eye(2),A1(t))-kron(B1(t).',eye(2));
end