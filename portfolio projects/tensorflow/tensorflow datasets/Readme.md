<h1>90 Days of portfolio projects in IIT ROORKEE</h1>
<h1>Deployment of Data into disk using tfds</h1>
<li>It works in the fashion of ETL see helloworld example</li>
<li> you can version your dataset for reproducing it later </li>
<li> versioning style major.minor.patch (data changes.feature changes.serialization)</li>
<li>split API: legacy,split</li>
<li> you can use subsplit for further splitting of your dataset</li>
<li> use tfds.Split.TRAIN/TEST/VALIDATION.subsplit(k/tfds.percent[:])</li>
<li> you can also use weighted split</li>
<li> some invalid operations in split </li>
<li>cant split a split means chain rule doesnt hold .subsplit().subsplit() not allowed</li>
<li> If you have repeated value not alloewd subsplit(some training segment) + training data<li>
<li>can't subsplit a merged data</li>
<li>split s3 is represent string,split,slice</li>
<li>checking of s3 tfds.core.Experiment.S3</li>
<h2>Input data into pipeleine</h2>
<li>tf.data() --> easy to use , flexible</li>
<h3>Example image model pipeline</h3>
<li>Aggregate data from files in a distributed file system</li>
<li>Apply random perturbations to each image</li>
<li>Merge randomly selected images into a batch for training</li>
<li>Example text model pipeline</li>
<li>Extracting symbols from raw text data</li>
<li>Converting them to embedding identifiers with a lookup table</li>
<li>Batching together sequences of different lengths</li>