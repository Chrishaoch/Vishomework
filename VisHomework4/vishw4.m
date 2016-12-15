%Vishomework 4
%data processing
%The data here is sorted by excel

close all
clc
clear
% Read data
[num,txt,whole]=xlsread('data2ehrSample.xlsx');

PatientID=[];
ind=1;
for ii=1:length(num(:,1))-1
    %for each row to load encounters and days
    if (num(ii,1)-num(ii+1,1))
        PatientID(ind,1)=num(ii,1);
        PatientID(ind,2)=ii;
        PatientID(ind,3)=ind;
        ind=ind+1;
    end
end
        PatientID(ind,1)=num(length(num(:,1)),1);
        PatientID(ind,2)=length(num(:,1));
        PatientID(ind,3)=ind;
%calc encounters
encterstat={};
for ii=19:34
    %index of this type of encounters
    encterstat{1,ii-18}=find(num(:,ii));
    % the encountered day
    encterstat{2,ii-18}=num(find(num(:,ii)),6);
    % PatientID
    encterstat{3,ii-18}=num(find(num(:,ii)),1);
end

%in order
final={};
for ii=1:length(encterstat)
    final{ii}=cell2mat([encterstat(3,ii) encterstat(2,ii)]);
end
f=final;
for k=1:length(PatientID)
    for kk=1:length(final)
        final{kk}(find(final{kk}==PatientID(k)))=k;
    end
end
final(:,1)=[];
savejson('',final,'haoprocessed.json');
