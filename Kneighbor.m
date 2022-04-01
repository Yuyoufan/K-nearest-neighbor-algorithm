function label = Kneighbor(ldata, data, K,distance_mode)
    %ldata：表示已有标记的数据，ldata的第一列是标签数据
    %data：需要进行分类的数据
    %distance_mode:1:max距离 2:曼哈顿距离 3:欧氏距离
    % 算法的思想就是，从ldata中找出离data最近的K
    % 个样本，看K个样本中最多的是哪一类，就将data
    % 分归为哪一类%
    
    %% 求出data到所有样本的距离
    [n, ~] = size(ldata);   % n个数据，m个维度
    ndata = (ones([n, 1]))*data(2:end);
    if distance_mode==1;
        distance = max(ldata(:,2:end) - ndata,[],2);%算max距离
    elseif distance_mode==2;
        distance = sum(abs((ldata(:,2:end) - ndata)), 2);%算曼哈顿距离
    else  distance_mode==3;
        distance = sum((ldata(:,2:end) - ndata).^2, 2);%算欧氏距离 
    end
    %% 得到最近的K个样本
    [~, I] = mink(distance, K);
    
    % 统计K个样本中最多的是哪一类
    classes = ldata(I,1);
    label = mode(classes);
       
end