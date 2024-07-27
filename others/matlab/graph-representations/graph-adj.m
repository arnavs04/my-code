function adjList = adjMatrixToAdjList(adjMatrix)
    [numNodes, ~] = size(adjMatrix);
    adjList = cell(1, numNodes);
    for i = 1:numNodes
        neighbors = find(adjMatrix(i, :));
        adjList{i} = neighbors;
    end
end

function adjMatrix = adjListToAdjMatrix(adjList)
    numNodes = length(adjList);
    adjMatrix = zeros(numNodes);
    for i = 1:numNodes
        neighbors = adjList{i};
        adjMatrix(i, neighbors) = 1;
    end
end

function adjMatrix = edgeListToAdjMatrix(edgeList)
    numNodes = max(max(edgeList));
    adjMatrix = zeros(numNodes);
    for i = 1:size(edgeList, 1)
        node1 = edgeList(i, 1);
        node2 = edgeList(i, 2);
        adjMatrix(node1, node2) = 1;
        adjMatrix(node2, node1) = 1;
    end
end

function edgeList = adjMatrixToEdgeList(adjMatrix)
    [row, col] = find(adjMatrix);
    edgeList = [row, col];
end

function edgeList = adjListToEdgeList(adjList)
    edgeList = [];
    for i = 1:length(adjList)
        node = i;
        neighbors = adjList{i};
        for j = 1:length(neighbors)
            edgeList = [edgeList; [node, neighbors(j)]];
        end
    end
end

function adjList = edgeListToAdjList(edgeList)
    numNodes = max(max(edgeList));
    adjList = cell(1, numNodes);
    for i = 1:size(edgeList, 1)
        node1 = edgeList(i, 1);
        node2 = edgeList(i, 2);
        adjList{node1} = [adjList{node1}, node2];
        adjList{node2} = [adjList{node2}, node1];
    end
end

% Example usage
adjMatrix = [
    0 1 1 0;
    1 0 1 1;
    1 1 0 1;
    0 1 1 0
];

adjList = adjMatrixToAdjList(adjMatrix);
if numel([adjList{:}]) <= 100
    disp('Converted Adjacency List:');
    disp(adjList);
else
    disp('Converted Adjacency List is too large to display.');
end

adjMatrixConverted = adjListToAdjMatrix(adjList);
edgeList = adjMatrixToEdgeList(adjMatrix);
adjListConverted = edgeListToAdjList(edgeList);

disp('Original Adjacency Matrix:');
disp(adjMatrix);

disp('Converted Adjacency Matrix:');
disp(adjMatrixConverted);

disp('Converted Edge List:');
disp(edgeList);

if numel([adjListConverted{:}]) <= 100
    disp('Converted Adjacency List:');
    disp(adjListConverted);
else
    disp('Converted Adjacency List is too large to display.');
end