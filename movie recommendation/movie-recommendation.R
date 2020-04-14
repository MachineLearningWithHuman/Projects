#MovieLens Recommendation
#MovieLens Data


#library importing 
library(recommenderlab) #for recommendation
library(reshape2)
library(data.table)
library(ggplot2) #visualization


#Retriveving the data
movie_data <- read.csv("./IMDB-Dataset/movies.csv", stringsAsFactors = FALSE)
rating_data <- read.csv("./IMDB-Dataset/ratings.csv")

#structure
str(movie_data)
str(rating_data)


#tabuler view
datatable(movie_data)  #id,title,genres
datatable(rating_data)


#summary statistics
summary(movie_data)
summary(rating_data)


#we need to do some thing with genre more usefull
movie_genre <- as.data.frame(movie_data$genres, stringsAsFactors = FALSE)
movie_genre2 <- as.data.frame(tstrsplit(movie_genre[,1], "[|]", type.convert = TRUE),stringsAsFactors = FALSE)



colnames(movie_genre2) <-c(1:10)

list_genre <- c("Action", "Adventure", "Animation", "Children", 
                "Comedy", "Crime","Documentary", "Drama", "Fantasy",
                "Film-Noir", "Horror", "Musical", "Mystery","Romance",
                "Sci-Fi", "Thriller", "War", "Western")

genre_matl <- matrix(0,10330,18)
genre_matl[1,] <- list_genre
colnames(genre_matl) <- list_genre

for (index in 1:nrow(movie_genre2)){
  for(col in 1:ncol(movie_genre2)){
    gen_col = which(genre_matl[1,] == movie_genre2[index,col])
    genre_matl[index+1,gen_col] <- 1
  }
}


genre_mat2 <- as.data.frame(genre_matl[-1,], stringsAsFactors=FALSE)

for (col in 1:ncol(genre_mat2)) {
  genre_mat2[,col] <- as.integer(genre_mat2[,col])
}

str(genre_mat2)


#head(movie_data)
#create a search matrix that gives us films based on genres

SearchMovie <- cbind(movie_data[,1:2],genre_mat2[])

head(SearchMovie)


#many movies have several genre 
#let's create sparse matrix for recommendation

ratingMatrix <- dcast(rating_data, userId~movieId, value.var = "rating", na.rm=FALSE) #basically our sparse matrix
ratingMatrix <- as.matrix(ratingMatrix[,-1]) #remove userIds
#Convert rating matrix into a recommenderlab sparse matrix
ratingMatrix <- as(ratingMatrix, "realRatingMatrix")


#recommendation model
recommendation_model <- recommenderRegistry$get_entries(dataType = "realRatingMatrix")
names(recommendation_model)



lapply(recommendation_model, "[[", "description")
#we will use item based collaborative filtering

recommendation_model$IBCF_realRatingMatrix$parameters


#let's check similarity
similarity_mat <- similarity(ratingMatrix[1:4, ],method = "cosine",which="users")

as.matrix(similarity_mat)

image(as.matrix(similarity_mat), main = "User's Similarity")

#let's check similarity of movies
movie_similarity<- similarity(ratingMatrix[ ,1:4],method = "cosine",which="items")

as.matrix(movie_similarity)

image(as.matrix(movie_similarity), main = "movie Similarity")


#rating values
rating_values <- as.vector(ratingMatrix@data)
unique(rating_values)

#how much rating as count of numbers

Table_rating <- table(rating_values)
Table_rating


#most viewed movies visualization

movie_views <- colCounts(ratingMatrix) # count views for each movie
table_views <- data.frame(movie = names(movie_views),
                          views = movie_views) # create dataframe of views
table_views <- table_views[order(table_views$views,
                                 decreasing = TRUE), ] # sort by number of views
table_views$title <- NA
for (index in 1:10325){
  table_views[index,3] <- as.character(subset(movie_data,
                                              movie_data$movieId == table_views[index,1])$title)
}
table_views[1:6,]

#plotting this data
ggplot(table_views[1:6, ], aes(x = title, y = views)) +
geom_bar(stat="identity", fill = 'steelblue') +
  geom_text(aes(label=views), vjust=-0.3, size=3.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Total Views of the Top Films")

#Heatmap of rating matrix

image(ratingMatrix[1:30,1:30], axes=FALSE, main = "30 X 30 heatmap")

#lot's of sparse data

#now we will
#1.select usefull data  done
#2.normalize it
#3.binarize it

#you have seen the rating dataset ok so what do you think how many user needs to 
#rate a movie to be usefull let's say 50

movie_ratings <- ratingMatrix[rowCounts(ratingMatrix) > 50,colCounts(ratingMatrix) > 50]
                              
Movie_ratings

#this bunch of code finds a heatmap of top user and movies
minimum_movies<- quantile(rowCounts(movie_ratings), 0.98)
minimum_users <- quantile(colCounts(movie_ratings), 0.98)
image(movie_ratings[rowCounts(movie_ratings) > minimum_movies,
                    colCounts(movie_ratings) > minimum_users],
      main = "Heatmap of the top users and movies")

#what we need to do much ago distribution of average rating of users
average_ratings <- rowMeans(movie_ratings)
qplot(average_ratings, fill=I("black"), col=I("blue")) +
  ggtitle("Distribution of the average rating per user")


#normalize data
normalized_ratings <- normalize(movie_ratings)
sum(rowMeans(normalized_ratings) > 0.00001)

#heatmap of normalized value
image(normalized_ratings[rowCounts(normalized_ratings) > minimum_movies,
                         colCounts(normalized_ratings) > minimum_users],
      main = "Normalized Ratings of the Top Users")


#binarize means 0 and 1 we will recommend if rating of that movie 
# is greater than 3.5

binary_minimum_movies <- quantile(rowCounts(movie_ratings), 0.90)
binary_minimum_users <- quantile(colCounts(movie_ratings), 0.90)


movies_watched <- binarize(movie_ratings, minRating = 1)

good_rated_films <- binarize(movie_ratings, minRating = 3.5)
image(good_rated_films[rowCounts(movie_ratings) > binary_minimum_movies,
                       colCounts(movie_ratings) > binary_minimum_users],
      main = "Heatmap of the top users and movies")


#Collaborative Filtering System
sampled_data<- sample(x = c(TRUE, FALSE),
                      size = nrow(movie_ratings),
                      replace = TRUE,
                      prob = c(0.8, 0.2))
training_data <- movie_ratings[sampled_data, ]
testing_data <- movie_ratings[!sampled_data, ]


#recommendation system
recommendation_system <- recommenderRegistry$get_entries(dataType ="realRatingMatrix")
recommendation_system$IBCF_realRatingMatrix$parameters


recommen_model <- Recommender(data = training_data,
                              method = "IBCF",
                              parameter = list(k = 30))
recommen_model


class(recommen_model)


info <- getModel(recommen_model)
class(info$sim)

top_items <- 20
image(info$sim[1:top_items, 1:top_items],
      main = "Heatmap of the first rows and columns")




#we will carry out the sum of rows and columns with the similarity of the objects above 0

sum_rows <- rowSums(info$sim > 0)
table(sum_rows)
sum_cols <- colSums(info$sim > 0)
qplot(sum_cols, fill=I("steelblue"), col=I("red"))+ ggtitle("Distribution of the column count")


#let's recommend
top_recommendations <- 10 # the number of items to recommend to each user
predicted_recommendations <- predict(object = recommen_model,
                                     newdata = testing_data,
                                     n = top_recommendations)
predicted_recommendations



#let's see some of the names

user1 <- predicted_recommendations@items[[1]] # recommendation for the first user
movies_user1 <- predicted_recommendations@itemLabels[user1]
movies_user2 <- movies_user1
for (index in 1:10){
  movies_user2[index] <- as.character(subset(movie_data,
                                             movie_data$movieId == movies_user1[index])$title)
}
movies_user2

#recommender matrix
recommendation_matrix <- sapply(predicted_recommendations@items,
                                function(x){ as.integer(colnames(movie_ratings)[x]) }) # matrix with the recommendations for each user
#dim(recc_matrix)
recommendation_matrix[]


#thank you 










