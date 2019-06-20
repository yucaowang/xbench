<!doctype html>
<html>
<head>
    <title>Xbench Report</title>
    <meta charset="UTF-8"/>
    <style type="text/css">
        .left-column {
            position: fixed;
            width:20%;
            border-radius: 5px;
            background-color: #f2f2f2;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -khtml-border-radius: 5px;
        }
        .right-column {
            margin-left: 22%;
            width:60%;
        }
        .left-column ul,h2 {
            display: block;
            margin: 10px;
            padding: 0;
            list-style: none;
        }
        .left-column ul{
            border-top: 1px solid #d9d9d9;
            font-size: 14px;
        }
        .left-column li{
            margin-bottom: 5px;
            color: #5e6b73;
        }
        .left-column h3 {
            border-left: 5px solid #009a61;
        }
        .right-column>div {
            border-top: 1px solid #d9d9d9;
        }
        .right-column table {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
            margin-bottom: 10px;
        }
        .right-column th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #f2f2f2;
        }
        .right-column td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
        .tag {
            display: inline-block;
            margin-bottom: 10px;
            padding: 5px 10px;
            background-color: rgba(1,126,102,0.08);
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color: #017E66;
            text-align: center;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -khtml-border-radius: 5px;
        }
        pre {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            background-color: #f2f2f2;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -khtml-border-radius: 5px;
            overflow:auto;
            max-height:300px;
            font-size:12px;
        }
    </style>
</head>
<body>

<main>
    <div class="left-column">
        <h2>Xbench Report</h2>
        <ul>
            <h3>&nbspBasic information</h3>
            <li><strong>DLT: &nbsp</strong><span>{{.BlockChain}}</span></li>
            <li><strong>Benchmark: &nbsp</strong><span>simple</span></li>
            <li><strong>Description: &nbsp</strong><span>This is an {{.BlockChain}} benchmark for caliper, to test the backend DLT&#39;s performance with simple account opening &amp; querying transactions</span></li>
            <li><strong>Test Rounds: &nbsp</strong><span>{{.TestRound}}</span></li>
            <li><a href="#benchmarkInfo">Details</a></li>
        </ul>

        <ul>
            <h3>&nbspSystem Under Test</h3>
            <li><strong>Version: &nbsp</strong><span>{{.Version}}</span></li>
            <li><strong>Size: &nbsp</strong><span>unknown</span></li>
            <li><strong>consensus: &nbsp</strong><span>DPOS</span></li>
            <li><strong>Distribution: &nbsp</strong><span>Single Host</span></li>
            <li><a href="#sutdetails">Details</a></li>
        </ul>
        
        <ul>
            <h3>&nbspBenchmark results</h3>
            <li><a href="#benchmarksummary">Summary</a></li>
            <li><a href="#round 0">round 0</a></li>
        </ul>
        
    </div>

    <div class="right-column">
        <div id="benchmarksummary">
            <table>
                <h3>Summary</h3>
                <tr>
                     <th>Test</th> <th>Name</th> <th>Succ</th> <th>Fail</th> <th>Send Rate</th> <th>Max Latency</th> <th>Min Latency</th> <th>Avg Latency</th> <th>Throughput</th>
                </tr>

{{range .TpsList}}
<tr>
        <td>{{.Round}}</td> 
        <td>{{.Name}}</td> 
        <td>{{.Succ}}</td> 
        <td>{{.Fail}}</td> 
        <td>{{.SendRate}}</td> 
        <td>{{.MaxLat}}</td> 
        <td>{{.MinLat}}</td> 
        <td>{{.AvgLat}}</td> 
        <td>{{.Tps}}</td>
</tr>
{{end}}


            </table>
        </div>

        <div id="round 0">

            <!--
            <h3>round 0&nbsp-&nbspdeal</h3>
            <strong class="tag">performance metrics</strong>
            <table>
                <tr>
                     <th>Name</th> <th>Succ</th> <th>Fail</th> <th>Send Rate</th> <th>Max Latency</th> <th>Min Latency</th> <th>Avg Latency</th> <th>Throughput</th>
                </tr>
                <tr>
                     <td>deal</td> <td>0</td> <td>49899</td> <td>15330tps</td> <td>0.0000 s</td> <td>100000.0000 s</td> <td>NaN s</td> <td>0 tps</td>
                </tr>
            </table>
            -->

            <strong class="tag">resource consumption</strong>
            <table>
                <tr>
                     <th>TYPE</th> <th>NAME</th> <th>Memory(max)</th> <th>Memory(avg)</th> <th>CPU(max)</th> <th>CPU(avg)</th> 
                     <!--
                     <th>Traffic In</th> <th>Traffic Out</th>
                     -->
                </tr>

{{range .ResList}}
<tr>
        <td>{{.Type}}</td> 
        <td>{{.Name}}</td> 
        <td>{{.MemMax}}</td> 
        <td>{{.MemAvg}}</td> 
        <td>{{.CPUMax}}</td> 
        <td>{{.CPUAvg}}</td> 
</tr>
{{end}}
            </table>
        </div>

        <div>
            <h3>Test Environment</h3>
            <strong class="tag">benchmark config</strong>
            <pre id="benchmarkInfo">
{{.Config}}
            </pre>
            <strong class="tag">SUT</strong>
            <pre id="sutdetails">not provided</pre>
        </div>
    </div>


</main>

</body>
</html>
