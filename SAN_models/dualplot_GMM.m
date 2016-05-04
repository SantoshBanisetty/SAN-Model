function [objapp, objinapp] = plot_GMM(Dataapp, Datainapp, num_clusters)%,ids)


[numapp qapp] = size(Dataapp)
[numinapp qinapp] = size(Datainapp)

totapp = qapp*(qapp-1)/2;
totinapp = qinapp*(qinapp-1)/2;
xxapp = 1;
xxinapp = 1;
optionsapp = statset('Display','iter','MaxIter',1000);
optionsinapp = statset('Display','iter','MaxIter',1000);

labels = {'Time' 'Per1 and Hallway left (cm)' 'Per1 and Hallway right (cm)' 'Per1 and robot (cm)' 'Per2 and Hallway left (cm)' 'Per2 and Hallway right (cm)' 'Per2 and robot (cm)' 'Per1 and Per2 distance (cm)' 'inter person distance' 'p1hl - p2hl'};

colors = [ [0 0 0] ; [0.8 0 0] ; [0 0.8 0] ; [0 0 0.8] ; 
					 [0.8 0.8 0] ; [0.8 0 0.8] ; [0 0.8 0.8] ; [0.4 0.4 0.4] ];
mcolor=[];
objapp=gmdistribution.fit(Dataapp,num_clusters,'Options',optionsapp,'Replicates',50);
objinapp=gmdistribution.fit(Datainapp,num_clusters,'Options',optionsinapp,'Replicates',50);
for j=1:qinapp
    for k=j+1:qinapp
				[j k]
        %subplot(tot, 1, xx);
        xxapp = xxapp+1;		
        figure
        
				for i=1:numapp
					mcolor(i,:) = colors(4,:);
                    plot(Dataapp(i,j), Dataapp(i,k), 'x', 'markerSize',4,'color',mcolor(i,:));
                    hold on;
                end
				for ii=1:numinapp
					mcolor(ii,:) = colors(2,:);
                    plot(Datainapp(ii,j), Datainapp(ii,k), 'x', 'markerSize',4,'color',mcolor(ii,:));
                    hold on;
                end

        plotGMM([objapp.mu(:,j) objapp.mu(:,k)]', objapp.Sigma([j,k],[j,k],:), [0 0.2 0], 1);
        objapp.Sigma([j,k],[j,k],:)
        
        plotGMM([objinapp.mu(:,j) objinapp.mu(:,k)]', objinapp.Sigma([j,k],[j,k],:), [0 0.2 0], 1);
        objinapp.Sigma([j,k],[j,k],:)
        
        xlabel(labels(j)); ylabel(labels(k));
    end
end