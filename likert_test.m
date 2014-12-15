
allLabels={'Very Useless',
    'Useless', 
    'Neutral', 
    'Useful',
    'Very Useful'};

allGroups={'This script',
    'Sliced bread',
    'Time machines'};

%% number of replies in each rating category
ratings=[%
    20, 20, 20, 20, 20;
    10, 0, 20, 30, 40;
    0, 0, 20, 10, 70; 
    
];


question=['How useful do you find the following?'];


likert(allLabels,allGroups,ratings,question)


