##function reads series of wearable technology test data

##output is data.frame which 
##provides average measurement values per subject and activity for 
##a subset of measurements

##should be executed from directory with test/train directories

run_analysis <- function(){
      
      ##load plyr
      library(dplyr)
      library(reshape2)
      
      ##read data into various data frames in prep for clipping together
      actv<-read.table("activity_labels.txt")
      features<-read.table("features.txt")
      test_subject<-read.table("test/subject_test.txt")
      test_label<-read.table("test/y_test.txt")
      test_data<-read.table("test/X_test.txt")
      train_subject<-read.table("train/subject_train.txt")
      train_label<-read.table("train/y_train.txt")
      train_data<-read.table("train/X_train.txt")
      closeAllConnections()
      
      ##build the variable names
      names(actv)<-c("activity_id","activity_name")
      names(test_label)<-("activity_id")
      names(train_label)<-("activity_id")
      names(test_subject)<-("subject_id")
      names(train_subject)<-("subject_id")
      names(test_data)<-as.character(features[,2])
      names(train_data)<-as.character(features[,2])
      
      ##compile the dataset
      all_test<-cbind(test_subject,test_label,test_data)
      all_train<-cbind(train_subject,train_label,train_data)
      all_data<-rbind(all_test,all_train)
      
      ##merge the activity
      all_data<-join(all_data,actv,by="activity_id")
      
      ##only want variable with mean() and std()
      mean_std<-cbind(all_data[,1:2],all_data[,length(all_data)])
      all_data_vars<-colnames(all_data)
      mean_std_vars<-c("subject_id","activity_id","activity")
      
      ##conitnue to build mean_std
      for (i in 1:length(all_data)){
            incl<-regexpr("mean()",all_data_vars[i], fixed=TRUE)
            if(incl==-1){incl<-regexpr("std()",all_data_vars[i],fixed=TRUE)}
            if (!incl==-1){
                  mean_std<-cbind(mean_std,all_data[,i])
                  mean_std_vars<-c(mean_std_vars,all_data_vars[i])
            } 
      }
      
      names(mean_std)<-mean_std_vars
      
      ##now you have your first subset (step 4)
      ##time to summarize based on subject and activity
      mean_std = select(mean_std,-activity_id)
      mean_std_melt = melt(mean_std, id = c("subject_id","activity"))
      mean_std_mean = dcast(mean_std_melt, subject_id + activity ~ variable, mean)

      ##return the wide tidydata
      mean_std_mean
      
}

