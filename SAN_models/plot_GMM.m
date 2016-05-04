function [obj] = plot_GMM(Data,num_clusters)%,ids)

[num q] = size(Data)
tot = q*(q-1)/2;
xx = 1;
options = statset('Display','iter','MaxIter',1000);

labels = {'Time' 'Per1 and Hallway left (cm)' 'Per1 and Hallway right (cm)' 'Per1 and robot (cm)' 'Per2 and Hallway left (cm)' 'Per2 and Hallway right (cm)' 'Per2 and robot (cm)' 'Per1 and Per2 distance (cm)' 'inter person distance' 'p1hl - p2hl'};

colors = [ [0 0 0] ; [0.8 0 0] ; [0 0.8 0] ; [0 0 0.8] ; 
					 [0.8 0.8 0] ; [0.8 0 0.8] ; [0 0.8 0.8] ; [0.4 0.4 0.4] ];
mcolor=[];
obj=gmdistribution.fit(Data,num_clusters,'Options',options,'Replicates',50);
for j=1:q
    for k=j+1:q
				[j k]
        %subplot(tot, 1, xx);
        xx = xx+1;		
        figure
        
				for i=1:num
					mcolor(i,:) = colors(4,:);
                    plot(Data(i,j), Data(i,k), 'x', 'markerSize',4,'color',mcolor(i,:));
                    hold on;
                end

        plotGMM([obj.mu(:,j) obj.mu(:,k)]', obj.Sigma([j,k],[j,k],:), [0 0.2 0], 1);
        obj.Sigma([j,k],[j,k],:)
        
        xlabel(labels(j)); ylabel(labels(k));
    end
end
