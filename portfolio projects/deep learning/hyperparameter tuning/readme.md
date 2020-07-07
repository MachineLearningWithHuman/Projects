<h1>90 Days of portfolio projects in IIT ROORKEE</h1>
<h1>Tune hyperparameter</h1>
<li>list of hyperparameter: layers,hidden units,learning rate, activation function</li>
<li>train:60% test:20% dev: 20%</li>
<li>for heavy data train:98% test/valid:1</li>
<li>distribution needs to be same </li>
<li>for structural data use bigquerys farmfingerprint function</li>
<h2>Bias and Variance</h2>
<li>variance error > train error : overfit</li>
<li>variance error ~= train error : high bias/underfit</li>
<li>both are high : high bias and high variance</li>
<li>both are low: both are low</li>
<li>you cannot acheive more accuracy than baysian optimum error </li>
<li>high bias: bigger network, train longer</li>
<li>high variance: more data, regularization</li>
<li><a href="https://ml-cheatsheet.readthedocs.io/en/latest/regularization.html">visit for regularization</a></li>
<li>l1 supress the less important information while l2 keeps them closer to zero and elastic net is a combination of the above two other regularization methods are dropout,data agumentation, early stopping, ensemble, cross validation,noise injection</li>
<li>due to regularization every layers will be roughly linear due to lambda</li>
<li>dropout applies at training network only</li>
<li>vanishing gradient have to keep in mind</li>
<li>In logistic regression you can initiate your weights as zero but in case of neural network it is not the case</li>
<li>use np.random.randn(shape)*initializer</li>
<li><a href="https://www.wandb.com/articles/the-effects-of-weight-initialization-on-neural-nets#:~:text=Different%20weight%20initialization%20schemes&text=Weights%20initialized%20with%20values%20sampled,distribution%20with%20a%20careful%20tweak">how weight initializer affects accuracy</a></li>
<li>gradient checking to see your learning</li>
