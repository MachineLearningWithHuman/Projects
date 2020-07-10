<h1>90 days of portfolio projects in IIT ROORKEE</h1>
<h1>Sentiment Analysis Using Logistic Regression</h1>
<h2><b>You have tweets you have to find out is it positive or negative</b></h2>
<li>We will follow supervised learning process</li>
<li>First we need to represent a text into a list of vector ; we need vocabulary_file for it</li>
<li>with the corpus of data your vocabulary can be huge problematic sparse data problem</li>
<li>after words we will count there frequency in both positive and negative examples to add as features in our solution</li>
<li>each tweet will be  XS=[bias,sum of positive features,sum of negative features]</li>
<li>preprocessing text:remove stopwords, punctuation  stemming: check code </li>
<li> for stemming get intuitions by looking at GREAT > great and looking > loo </li>
<li> create one matrix: from preprocessing (Eg: I am happy that i came here:[happy,com]>vector[1,6,8])</li>
<li>apply the logistic regression model</li>
<h2>Naive Based Method</h2>
<li>some time within tweet corpus same phrase is used to describe both +ve and -ve moments so we are gonna use probabilistic model to decode this one easy way to visualize this as venn diagram</li>
<li><b>conditional probability :</b> asked questions like this given a phrase "happy" how many times it wil positive or how many positive tweet has the phrase "happy"</li>
<li>Naive bayes: why naive >> it assumes that the features are independent of each other</li>
<li>first find conditional probabily of the phrase with respect to classes</li>
<li> interesting features same probable phrase has no capability of determination of sentiment it's the uncommon phrase that determines the sentiment</li>
<li> now do p(w/p)/p(w/n) and multiply to get a value which will determine the sentiment</li>
<li>laplace smoothning: p(w/class) = freq(w,class) + 1/ Nclass + vclass(unique words)</li>
<li> probability cannot be zero in laplace smoothing</li>
<li>use log likelihood for sentiment score of words</li>
<li>sum for the best result</li>
<li> if value is greater than 0 it is a positive sentiment score</li>
<li>Assumptions: independent features, relative frequency of data</li>
<h2>Manipulation of words in vector space</h2>
<li>it contains stuff related to pca,embedding,distance</li>
<h1>Certificates</h1>
please validate my certificates
<li> <a href="https://www.coursera.org/account/accomplishments/records/MM3FDJPPVZ3Z">NLP in tensorflow</a></li>
