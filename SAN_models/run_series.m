function [BIC idx] = run_series(trainData, imin, imax, amin, bic, ix, num)

%[train, test] = crossvalind('holdOut',Data(:,1),0.90);
    
%trainData = Data(train,:);
%testData = Data(test,:);


[nnn q] = size(trainData);

BIC = bic;
idx = ix;

tc = zscore(trainData);


options = statset('Display','final','MaxIter',100);
for k=imin:imax
  obj=gmdistribution.fit(tc,k,'Options',options,'Replicates',num);
	objs{k-amin+1}=obj;
  AIC(k-amin+1)=obj.AIC;
  BIC(k-amin+1)=obj.BIC
  idx(k-amin+1)=k;
  add(k-amin+1) = ((k-1)/2.0)*log(nnn)+((q*q*3*q)/4.0)*k*log(nnn);
  LogLik(k-amin+1) = obj.NlogL;
  plot(idx,LogLik+add);
  drawnow;
end

