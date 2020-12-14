function [secondary_index] = creatSecondaryIndex(xls_num, fixation_cell, TXT)
%creatSecondaryIndex create an secondary table for fixation or saccade
% Specifically, secondary_index(k, 1) is the first fixation of image k and
% secondary(k, 2) is the last fixation of image k

n = size(TXT,1); % the number of images
secondary_index = zeros(n,2);
m = size(xls_num,1);
num_of_fixations_in_this_img = 0; %the number of fixations in this pic


index_of_fixations = 1;
while index_of_fixations < m %����ע�ӵ㣬�˴�һ��Сbug�����ܵ���m����Ȼѭ��������
    for k = 1:100 %����100��ͼƬ��Ѱ��kֵ��kֵ��ʾ��ǰע�ӵ��Ӧ��k��ͼƬ
        if(isequal(fixation_cell(index_of_fixations,1),TXT(k,1)))
            num_of_fixations_in_this_img = xls_num(index_of_fixations,1);
            break;
        end
    end
    secondary_index(k,1) = index_of_fixations;%�����������k��ͼƬ����ʼ��
    index_of_fixations = index_of_fixations + num_of_fixations_in_this_img;
    secondary_index(k,2) = index_of_fixations-1;%�����������k��ͼƬ����ֹ��
end