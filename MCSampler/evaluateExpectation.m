function [e, mean] = evaluateExpectation( model, interval, range )

% Basic Metropolis (symmetric) sampling 

if( ~isstruct( model ) )
    error('Erroneous model')
end

% Sampler parameters
mean = [];
e = [];

for x=range(1):interval:range(2)

    for y = range(1):interval:range(2)
   
        f = model.density( x, y );
    
        e(end+1,:) = [ x y f];

        mean(end+1,:) = [e(:,1)'*e(:,3) e(:,2)'*e(:,3)];
        
    end
end


