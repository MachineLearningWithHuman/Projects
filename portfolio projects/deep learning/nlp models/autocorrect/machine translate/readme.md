<h1>90 Days of portfolio projects in IIT ROORKEE</h1>
<h1>machine translation: elglish to bengali for example</h1>
<li>it can be refered as conditional language model</li>
<li>trying to predict conditional probability p(y1,y2....|x1,x2.....) </li>
<li> so given input x which is my english language it tries to predict a bunch of french sentences and we are gonna use argmax to pick the maximum probable function </li>
<li>beam search is the algorithm</li>
<li>Why not greeedy search? because it will result in a less optimal sentence/prediction</li>
<h2>Beam search</h2>
<li>beam considers multiple output for probability</li>
<li>parametric: b which is width of beam</li>
<li>in second word selection math is p(y1,y2|x)=p(y1|x)*p(y2|x,y1)</li>
<li>the last term is the output of the second conditional model</li>
<li>If beam width becomes to 1 it eventually becomes to greeedy search</li>
<li>length normalization: took log normalization of the values </li>
<li>use alpha for division </li>
<li>large b: slower, better result</li>
<li>error analysis: two parts beam search and rnn network</li>
<li>human:y* algo:y^ </li>
<li>p(y*/x) > p(y^/x) beam choose y^ but y* is higher so beam is falut</li>
<li>in opposite case rnn</li>
<li>encoder decoder persormes well on short sentence but prob;ematic in long run</li>
<li>attention models give attention to specific peice of informations </li>
<h2>Speech Recognisions</h2>
<li>ctc cost for speech recognition</li>
<li>trigger word recognition: before trigger word make everything 0</li>    
