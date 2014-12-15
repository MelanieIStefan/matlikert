
function likert(allLabels,allGroups,ratings,question)


figure




%% convert to percentage

a=sum(ratings,2);
b=repmat(a,1,5);

ratings=ratings./b;

% 
% %% Brewer diverging http://colorbrewer2.org
% Colors=1/255*[%
%     202,0,32;%
%     244,165,130;%
%     247,247,247;%
%     146,197,222;%
%     5,113,176];
%
%% Brewer diverging other way round
Colors=1/255*[%
    5,113,176;%
    146,197,222;%
    247,247,247;%
    244,165,130;%
     202,0,32];


% %% Brewer sequential 
% 
% Colors=1/255*[%
%     240,249,232;%
%     186,228,188;%
%     123,204,196;%
%     67,162,202;%
%     8,104,172];

% Colors=1/255*[%
% 8,104,172;%
% 67,162,202;%
%     123,204,196;%
%     186,228,188;%    
%     240,249,232];


total=size(ratings,1);

origin=max(sum(ratings,2))/2;

minstart=origin;
maxend=0;

for j=1:total
start=origin-1/2*ratings(j,3)-ratings(j,2)-ratings(j,1);     

if start<minstart
    minstart=start;
end


for i=1:5
    if ratings(j,i)~=0
        rectangle('Position', [start,total-j-0.2,ratings(j,i),0.5], 'FaceColor',Colors(i,:))
    end
    start=start+ratings(j,i);
    if i==5
        if start > maxend
            maxend=start;
        end
    end
end
%% line([origin origin],[total-j-0.2,total-j+0.2], 'Color','k', 'LineStyle','--'); 
%% text(minstart-0.05, total-j, OverallExperienceYear{j},'FontSize',12,'HorizontalAlignment','right','VerticalAlignment','middle');    
end

for j=1:total
%% text(origin, total-j+0.4, OverallExperienceYear{j},'FontSize',12,'HorizontalAlignment','center');
text(minstart-0.05, total-j, allGroups{j},'FontSize',12,'HorizontalAlignment','right','VerticalAlignment','middle');    
end

line([origin origin],[-0.2,total-0.8], 'Color','k', 'LineStyle','--'); 

%% ylim([-0.5,total])
xlim([-0.5,2.5])
axis off
%% box off
line([minstart-0.1,maxend+0.1],[-0.5,-0.5],'Color', 'k')
text(origin,-0.8,'0','FontSize',12,'HorizontalAlignment','center')
line([origin origin],[-0.55,-0.45],'Color','k')
leftLabelNumber=0;
leftLabelPos=origin;
while leftLabelPos > minstart + 0.1
    leftLabelPos=leftLabelPos-0.2;
    leftLabelNumber=leftLabelNumber+20;
    text(leftLabelPos,-0.8,[num2str(leftLabelNumber)],'HorizontalAlignment','center','FontSize',12)
    line([leftLabelPos leftLabelPos],[-0.55,-0.45],'Color','k')
end


rightLabelNumber=0;
rightLabelPos=origin;
while rightLabelPos < maxend-0.1
    rightLabelPos=rightLabelPos+0.2;
    rightLabelNumber=rightLabelNumber+20;
    text(rightLabelPos,-0.8,[num2str(rightLabelNumber)],'HorizontalAlignment','center','FontSize',12)
    line([rightLabelPos rightLabelPos],[-0.55,-0.45],'Color','k')
end

text(origin, -1.1, 'Percentage', 'FontSize',12, 'HorizontalAlignment','center')


%% line([],[],'Color','k')


%% legend at the bottom
for labelIndex=1:numel(allLabels)
    rectangle('Position', [origin + 1.2,total-0.6-0.4*(labelIndex),0.05,0.2], 'FaceColor',Colors(labelIndex,:))
    text(origin+1.3, total-0.6-0.4*(labelIndex), allLabels{labelIndex},'FontSize',12,'VerticalAlignment','middle')
end

title(question, 'FontSize',12,'FontWeight','bold')

end





