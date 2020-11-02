function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%{

i = 1;
min = Inf;
for CTest = [0.01 0.03 0.1 0.3 1 3 10 30]
  for sigmaTest = [0.01 0.03 0.1 0.3 1 3 10 30]
    
    fprintf("Iteration numer: ");
    display(i);
    fprintf("Testing with C and Sigma as : ");
    display(CTest);
    display(sigmaTest);
    
    model = svmTrain(X, y, CTest, @(x1, x2) gaussianKernel(x1, x2, sigmaTest), 1e-3, 20);
    pred = svmPredict(model, Xval);
    predError = mean((yval - pred).^2);
    
    fprintf("Prediction Error: ");
    display(predError);
    
    if min > predError
      C = CTest; 
      sigma = sigmaTest;
      min = predError;  
     
      fprintf("Found Better C and sigma: ");
      display(CTest);
      display(sigmaTest);
      display(min)
     
    endif
    i = i + 1;
  endfor
endfor

fprintf("Best C = ");
disp(C);
fprintf("Best sigma = ");
disp(sigma);

%}

C = 1; sigma = 0.1;




% =========================================================================

end
