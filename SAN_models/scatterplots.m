

ax1 = subplot(3,3,1);
scatter(appData(:,1), appData(:,2), 'b')
xlabel('Normalized Time'); ylabel('Per1 and hallway left (cm)');
%figure;
ax2 = subplot(3,3,2);
scatter(appData(:,1), appData(:,3), 'b')
xlabel('Normalized Time'); ylabel('Per1 and hallway right (cm)');

%figure;
ax3 = subplot(3,3,3);
scatter(appData(:,1), appData(:,4), 'b')
xlabel('Normalized Time'); ylabel('Per1 and the robot (cm)');

%figure;
ax4 = subplot(3,3,7);
scatter(appData(:,1), appData(:,5), 'b')
xlabel('Normalized Time'); ylabel('Per2 and hallway left (cm)');
%figure;
ax5 = subplot(3,3,8);
scatter(appData(:,1), appData(:,6), 'b')
xlabel('Normalized Time'); ylabel('Per2 and hallway right (cm)');
%figure;
ax6 = subplot(3,3,9);
scatter(appData(:,1), appData(:,7), 'b')
xlabel('Normalized Time'); ylabel('Per2 and the robot (cm)');

%figure;
ax7 = subplot(3,3,4);
scatter(appData(:,1), appData(:,8), 'b')
xlabel('Normalized Time'); ylabel('Per1-Per2 (cm)');

%figure;
ax8 = subplot(3,3,6);
scatter(appData(:,1), appData(:,9), 'b')
xlabel('Normalized Time'); ylabel('Per1 and hallway left - Per2 and hallway left(cm)');

hold(ax1, 'on')
scatter(ax1, inappData(:,1), inappData(:,2), 'r')
xlabel('Normalized Time'); ylabel('Per1 and hallway left (cm)');
%figure;
hold(ax2, 'on')
scatter(ax2, inappData(:,1), inappData(:,3), 'r')
xlabel('Normalized Time'); ylabel('Per1 and hallway right (cm)');
%figure;
hold(ax3, 'on')
scatter(ax3, inappData(:,1), inappData(:,4), 'r')
xlabel('Normalized Time'); ylabel('Per1 and the robot (cm)');

%figure;
hold(ax4, 'on')
scatter(ax4, inappData(:,1), inappData(:,5), 'r')
xlabel('Normalized Time'); ylabel('Per2 and hallway left (cm)');
%figure;
hold(ax5, 'on')
scatter(ax5, inappData(:,1), inappData(:,6), 'r')
xlabel('Normalized Time'); ylabel('Per2 and hallway right (cm)');
%figure;
hold(ax6, 'on')
scatter(ax6, inappData(:,1), inappData(:,7), 'r')
xlabel('Normalized Time'); ylabel('Per2 and the robot (cm)');

%figure;
hold(ax7, 'on')
scatter(ax7, inappData(:,1), inappData(:,8), 'r')
xlabel('Normalized Time'); ylabel('Per1-Per2 (cm)');

%figure;
hold(ax8, 'on')
scatter(inappData(:,1), inappData(:,9), 'r')
xlabel('Normalized Time'); ylabel('Per1 and hallway left - Per2 and hallway left(cm)');

