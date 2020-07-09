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