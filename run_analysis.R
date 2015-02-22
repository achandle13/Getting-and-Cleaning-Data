run_analysis <- function() {
  
  data_list <- vector("character")
  
  #Read appropriate data sets for the analysis

    X_train <- read.table("X_train.txt",header=FALSE,sep="")
      if(is.null(X_train)) {data_list[1]<- "X_train"}
       
    
    y_train <- read.table("y_train.txt",header=FALSE,sep="")
      if(is.null(y_train)) {data_list[2]<- "y_train"}
        
    
    subject_train <- read.table("subject_train.txt",header=FALSE,sep="")
      if(is.null(subject_train)) {data_list[3]<- "subject_train"}
        
    X_test <- read.table("X_test.txt",header=FALSE,sep="")
      if(is.null(X_test)) {data_list[4]<- "X_test"}
    
    y_test <- read.table("y_test.txt",header=FALSE,sep="")
       if(is.null(y_test)) {data_list[5]<- "y_test"}
        
    subject_test <- read.table("subject_test.txt",header=FALSE,sep="")
      if(is.null(subject_test)) {data_list[6]<- "subject_test"}
        
    features <- read.table("features.txt",header=FALSE,sep="",stringsAsFactors=FALSE)
      if(is.null(features)) {data_list[7] <- "features"}
          
  
  #Conditional test to ensure all necessary data sets have been included.  
  #Diagnostic message is given if needed.
  if(length(data_list)!=0){
    stop(cat(paste("The following data sets are missing from the working directory: ", data_list[1],", " ,data_list[2],", ","/n",
             data_list[3],", ", data_list[4],", ", data_list[5],", ", data_list[6], ", ", data_list[7], "." ,"/n",
             "Make sure the missing data sets are in the working directory and then call the run_analysis function."
    )))
  }
  
    #merge the data sets and remove unused datasets from memory
    df_train <- cbind(subject_train,y_train,X_train)
    rm(subject_train,y_train,X_train)
    
    df_test <- cbind(subject_test,y_test,X_test)
    rm(subject_test,y_test,X_test)
    
    df <- rbind(df_train,df_test)
    names(features) <- c("Number","Measurement")
    
    names(df) <- c("Subject","Activity",features$Measurement)
    rm(df_train,df_test)
    
    #Select only columns with mean or standard deviation in the column name
    df2 <- df[,c("Subject","Activity",colnames(df)[grep("mean()|std()",colnames(df))])]
    df_freq <- df2[,colnames(df2)[grep("meanFreq",colnames(df2))]]
    df2 <- df2[,!names(df2) %in% names(df_freq)]
    rm(df_freq)
    
    
    #Order the data set by subject first and then activity
    df2 <- df2[order(df2$Subject,df2$Activity),]
    
    #Calculate means across all columns by activity for each subject and then order the dataset by subject
    agg_df2<-aggregate(df2,by=list(df2$Subject,df2$Activity),FUN=mean)
    agg_df2<- agg_df2[order(agg_df2$Subject,agg_df2$Activity),]
    
    #Drop Group.1 and Group.2 from the dataset, left over from the aggregate function, remove the unused data set
    agg_df2<- agg_df2[,!(names(agg_df2) %in% c("Group.1","Group.2"))]
    rm(df2)
    
    #Replace activity numbers with descriptive labels
    agg_df2$Activity[agg_df2$Activity==1] <- "Walking"
    agg_df2$Activity[agg_df2$Activity==2] <- "Walking_Upstairs"
    agg_df2$Activity[agg_df2$Activity==3] <- "Walking_Downstairs"
    agg_df2$Activity[agg_df2$Activity==4] <- "Sitting"
    agg_df2$Activity[agg_df2$Activity==5] <- "Standing"
    agg_df2$Activity[agg_df2$Activity==6] <- "Laying"
    
    #Write out file to working directory
    write.table(agg_df2,"run_analysis.txt",sep=" ",row.name=FALSE)
    
    
    
    
}
