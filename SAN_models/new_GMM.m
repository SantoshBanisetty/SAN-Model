function [ appobj, inappobj ] = scratch_GMM( Dataapp, Datainapp, num_clusters, selectCols, labels )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[an, ap] = size(Dataapp);
[in, ip] = size(Datainapp);

d = 500;


options = statset('MaxIter',1000); % Increase number of EM iterations
        
appobj = fitgmdist(Dataapp,num_clusters,'CovarianceType','diagonal',...
                    'SharedCovariance',false,'Options',options);
clusterApp = cluster(appobj,Dataapp);
appmahalDist = mahal(appobj,Dataapp);
                
inappobj = fitgmdist(Datainapp,num_clusters,'CovarianceType','diagonal',...
                    'SharedCovariance',false,'Options',options);
clusterInapp = cluster(inappobj,Datainapp);
inappmahalDist = mahal(inappobj,Datainapp);

for f_index = 1:ap
    for s_index = f_index+1:ap
        %appx1 = linspace(min(Dataapp(:,f_index)) - 2,max(Dataapp(:,f_index)) + 2,d);
        %appx2 = linspace(min(Dataapp(:,s_index)) - 2,max(Dataapp(:,s_index)) + 2,d);
        %[appx1grid,appx2grid] = meshgrid(appx1,appx2);
        %appX0 = [appx1grid(:) appx2grid(:)];
        
        %inappx1 = linspace(min(Datainapp(:,f_index)) - 2,max(Datainapp(:,f_index)) + 2,d);
        %inappx2 = linspace(min(Datainapp(:,s_index)) - 2,max(Datainapp(:,s_index)) + 2,d);
        %[inappx1grid,inappx2grid] = meshgrid(inappx1,inappx2);
        %inappX0 = [inappx1grid(:) inappx2grid(:)];
        
        threshold = sqrt(chi2inv(0.99,2));
        figure;    
        %subplot(2,2,c);
                apph1 = gscatter(Dataapp(:,f_index),Dataapp(:,s_index),clusterApp);
                xlabel(labels(selectCols(f_index)));ylabel(labels(selectCols(s_index)));
                hold on;
                    for m = 1:num_clusters;
                        m
                        appidx = appmahalDist(:,m)<=threshold;
                        %Color = h1(m).Color*0.75 + -0.5*(h1(m).Color - 1);
                        apph2 = plot(Dataapp(appidx,f_index),Dataapp(appidx,s_index),'.','Color', 'c','MarkerSize',1);
                        
                        uistack(apph2,'bottom');
                        
                    end
                    
                 inapph1 = gscatter(Datainapp(:,f_index),Datainapp(:,s_index),clusterInapp);
                
                    for h = 1:num_clusters;
                        h
                        inappidx = inappmahalDist(:,h)<=threshold;
                        %Color = inapph1(h).Color*0.5 + -0.25*(inapph1(h).Color - 1);
                        inapph2 = plot(Datainapp(inappidx,f_index),Datainapp(inappidx,s_index),'.','Color','m','MarkerSize',1);
                        uistack(inapph2,'bottom');
                    end
                    
                plot(appobj.mu(:,f_index),appobj.mu(:,s_index),'kx','LineWidth',2,'MarkerSize',10)
                plot(inappobj.mu(:,f_index),inappobj.mu(:,s_index),'ko','LineWidth',2,'MarkerSize',10)
                title(sprintf('Sigma is %s, SharedCovariance = %s',...
                   'diagonal','false'),'FontSize',8)
                hold off
                %c = c + 1;
    end
end

end