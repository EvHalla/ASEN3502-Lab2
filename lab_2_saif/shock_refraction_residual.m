function [output] = shock_refraction_residual(phi, thetaC, thetaD, M2, M3, deltaA, deltaB, p2p1, p3p1)

p4p2 = ((2 * 1.4 * M2^2 * sin(thetaC)^2 - (1.4-1)))/(1.4+1);
p4PRIMEp3 = ((2 * 1.4 * M3^2 * sin(thetaD)^2 - (1.4-1)))/(1.4+1);


r1 = p2p1 * p4p2 - p3p1 * p4PRIMEp3;

r2 = (M2^2 * sin(2*thetaC) - 2*cot(thetaC))/(2+M2^2*(1.4+cos(2*thetaC))) - tan(deltaA - phi);

r3 = (M3^2 * sin(2*thetaD) - 2*cot(thetaD))/(2+M3^2*(1.4+cos(2*thetaD))) - tan(deltaB + phi);

output = [r1,r2,r3];

end


