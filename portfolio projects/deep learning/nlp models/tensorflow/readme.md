<h1>90 Days of portfolio projects in IIT ROORKEE</h1>
<h1> NLP in tensorflow Some specific tasks I have done</h1>
<h2>Word based Encoding</h2>
<li>use tf.keras.preprocessing.text to import Tokenizer</li>
<li> use Tokenizer(num_words=,oov_token="")</li>
<li>use tokenizer.fit_on_texts() to generate tokens </li>
<li> to see index print .word_index </li>
<li> text to sequence : tokenizer.texts_to_sequences()</li>
<li>tf.keras.preprocessing.sequence import pad_sequences </li>
<li> defalut sequences in front , use padding = "post" and truncating = "post"</li>
<li> And that is how you will do tokenization</li>
<h2>Word Embedding and binary classification</h2>
<li>You have to define vocab size and embedding dimension so it is parametric being dimentions need to be learn</li>
<li>after preprocessing we need one function to reverse index into word > subword text encoder</li>
<li>then we will define our model</li>
<li>use sequential > embedding > flat > dense > output structure </li>
<li> model.layers[0] will give you weights of embedding layer</li>
<li>download and visualize it on projector website of tensorflow</li>
<li> Start with a dataset in tfds then do it with your custom dataset </li>
<li> I have done it using imdb and yelp data then did it with custom sarcasm data and bbc review</li>
<li> for imdb results will look like this </li>
<img src="https://github.com/MachineLearningWithHuman/Projects/blob/master/portfolio%20projects/deep%20learning/nlp%20models/tensorflow/imdb_visualization/imdb.png" alt="t-sne visuals" width="1000" height="600">
<li> for sarcasm results will look like this </li>
<img src="https://github.com/MachineLearningWithHuman/Projects/blob/master/portfolio%20projects/deep%20learning/nlp%20models/tensorflow/sarcasm/sarcasm.png" alt="t-sne visuals" width="1000" height="600">
<li> for bbc results will look like this </li>
<img src="https://github.com/MachineLearningWithHuman/Projects/blob/master/portfolio%20projects/deep%20learning/nlp%20models/tensorflow/bbc/bbc.png" alt="t-sne visuals" width="1000" height="600">

