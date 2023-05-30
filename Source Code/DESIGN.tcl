
#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     132                       ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      2700                      ;# X dimension of topography
set val(y)      4738                      ;# Y dimension of topography
set val(stop)   120.0                     ;# time of simulation end

Phy/WirelessPhy set freq_ 2.472e9          ;#channel
Phy/WirelessPhy set bandwidth_ 11Mb        ;#Data Rate
Phy/WirelessPhy set Pt_ 1.31622777        ;#Transmit Power
Phy/WirelessPhy set CPThresh_ 10.0         ;#Collision Threshold
Phy/WirelessPhy set CSThresh_ 5.011872e-12 ;#Carrier Sense Power
Phy/WirelessPhy set RXThresh_ 5.82587e-09  ;#Receive Power Threshold
Mac/802_11 set dataRate_ 11Mb              ;#Rate for Data Frames
Mac/802_11 set basicRate_ 1Mb              ;#Rate for Control Frames


#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)

set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      OFF \
                -movementTrace OFF

#===================================
#        Nodes Definition        
#===================================
#Create 132 nodes
set n0 [$ns node]
$n0 set X_ 450
$n0 set Y_ 1600
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 500
$n1 set Y_ 1600
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 550
$n2 set Y_ 1600
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 600
$n3 set Y_ 1600
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 450
$n4 set Y_ 1550
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 500
$n5 set Y_ 1550
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 550
$n6 set Y_ 1550
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 600
$n7 set Y_ 1550
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 450
$n8 set Y_ 1500
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 500
$n9 set Y_ 1500
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20
set n10 [$ns node]
$n10 set X_ 550
$n10 set Y_ 1500
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20
set n11 [$ns node]
$n11 set X_ 600
$n11 set Y_ 1500
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20
set n12 [$ns node]
$n12 set X_ 450
$n12 set Y_ 1450
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20
set n13 [$ns node]
$n13 set X_ 500
$n13 set Y_ 1450
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20
set n14 [$ns node]
$n14 set X_ 550
$n14 set Y_ 1450
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20
set n15 [$ns node]
$n15 set X_ 600
$n15 set Y_ 1450
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20
set n16 [$ns node]
$n16 set X_ 1449
$n16 set Y_ 600
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20
set n17 [$ns node]
$n17 set X_ 1499
$n17 set Y_ 600
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20
set n18 [$ns node]
$n18 set X_ 1549
$n18 set Y_ 600
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20
set n19 [$ns node]
$n19 set X_ 1599
$n19 set Y_ 600
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20
set n20 [$ns node]
$n20 set X_ 1449
$n20 set Y_ 550
$n20 set Z_ 0.0
$ns initial_node_pos $n20 20
set n21 [$ns node]
$n21 set X_ 1499
$n21 set Y_ 550
$n21 set Z_ 0.0
$ns initial_node_pos $n21 20
set n22 [$ns node]
$n22 set X_ 1549
$n22 set Y_ 550
$n22 set Z_ 0.0
$ns initial_node_pos $n22 20
set n23 [$ns node]
$n23 set X_ 1599
$n23 set Y_ 550
$n23 set Z_ 0.0
$ns initial_node_pos $n23 20
set n24 [$ns node]
$n24 set X_ 1449
$n24 set Y_ 500
$n24 set Z_ 0.0
$ns initial_node_pos $n24 20
set n25 [$ns node]
$n25 set X_ 1499
$n25 set Y_ 500
$n25 set Z_ 0.0
$ns initial_node_pos $n25 20
set n26 [$ns node]
$n26 set X_ 1549
$n26 set Y_ 500
$n26 set Z_ 0.0
$ns initial_node_pos $n26 20
set n27 [$ns node]
$n27 set X_ 1599
$n27 set Y_ 500
$n27 set Z_ 0.0
$ns initial_node_pos $n27 20
set n28 [$ns node]
$n28 set X_ 1449
$n28 set Y_ 450
$n28 set Z_ 0.0
$ns initial_node_pos $n28 20
set n29 [$ns node]
$n29 set X_ 1499
$n29 set Y_ 450
$n29 set Z_ 0.0
$ns initial_node_pos $n29 20
set n30 [$ns node]
$n30 set X_ 1549
$n30 set Y_ 450
$n30 set Z_ 0.0
$ns initial_node_pos $n30 20
set n31 [$ns node]
$n31 set X_ 1599
$n31 set Y_ 450
$n31 set Z_ 0.0
$ns initial_node_pos $n31 20
set n32 [$ns node]
$n32 set X_ 2451
$n32 set Y_ 1601
$n32 set Z_ 0.0
$ns initial_node_pos $n32 20
set n33 [$ns node]
$n33 set X_ 2501
$n33 set Y_ 1601
$n33 set Z_ 0.0
$ns initial_node_pos $n33 20
set n34 [$ns node]
$n34 set X_ 2551
$n34 set Y_ 1601
$n34 set Z_ 0.0
$ns initial_node_pos $n34 20
set n35 [$ns node]
$n35 set X_ 2601
$n35 set Y_ 1601
$n35 set Z_ 0.0
$ns initial_node_pos $n35 20
set n36 [$ns node]
$n36 set X_ 2451
$n36 set Y_ 1551
$n36 set Z_ 0.0
$ns initial_node_pos $n36 20
set n37 [$ns node]
$n37 set X_ 2501
$n37 set Y_ 1551
$n37 set Z_ 0.0
$ns initial_node_pos $n37 20
set n38 [$ns node]
$n38 set X_ 2551
$n38 set Y_ 1551
$n38 set Z_ 0.0
$ns initial_node_pos $n38 20
set n39 [$ns node]
$n39 set X_ 2601
$n39 set Y_ 1551
$n39 set Z_ 0.0
$ns initial_node_pos $n39 20
set n40 [$ns node]
$n40 set X_ 2451
$n40 set Y_ 1501
$n40 set Z_ 0.0
$ns initial_node_pos $n40 20
set n41 [$ns node]
$n41 set X_ 2501
$n41 set Y_ 1501
$n41 set Z_ 0.0
$ns initial_node_pos $n41 20
set n42 [$ns node]
$n42 set X_ 2551
$n42 set Y_ 1501
$n42 set Z_ 0.0
$ns initial_node_pos $n42 20
set n43 [$ns node]
$n43 set X_ 2601
$n43 set Y_ 1501
$n43 set Z_ 0.0
$ns initial_node_pos $n43 20
set n44 [$ns node]
$n44 set X_ 2451
$n44 set Y_ 1451
$n44 set Z_ 0.0
$ns initial_node_pos $n44 20
set n45 [$ns node]
$n45 set X_ 2501
$n45 set Y_ 1451
$n45 set Z_ 0.0
$ns initial_node_pos $n45 20
set n46 [$ns node]
$n46 set X_ 2551
$n46 set Y_ 1451
$n46 set Z_ 0.0
$ns initial_node_pos $n46 20
set n47 [$ns node]
$n47 set X_ 2601
$n47 set Y_ 1451
$n47 set Z_ 0.0
$ns initial_node_pos $n47 20
set n48 [$ns node]
$n48 set X_ 1450
$n48 set Y_ 2601
$n48 set Z_ 0.0
$ns initial_node_pos $n48 20
set n49 [$ns node]
$n49 set X_ 1500
$n49 set Y_ 2601
$n49 set Z_ 0.0
$ns initial_node_pos $n49 20
set n50 [$ns node]
$n50 set X_ 1550
$n50 set Y_ 2601
$n50 set Z_ 0.0
$ns initial_node_pos $n50 20
set n51 [$ns node]
$n51 set X_ 1600
$n51 set Y_ 2601
$n51 set Z_ 0.0
$ns initial_node_pos $n51 20
set n52 [$ns node]
$n52 set X_ 1450
$n52 set Y_ 2551
$n52 set Z_ 0.0
$ns initial_node_pos $n52 20
set n53 [$ns node]
$n53 set X_ 1500
$n53 set Y_ 2551
$n53 set Z_ 0.0
$ns initial_node_pos $n53 20
set n54 [$ns node]
$n54 set X_ 1550
$n54 set Y_ 2551
$n54 set Z_ 0.0
$ns initial_node_pos $n54 20
set n55 [$ns node]
$n55 set X_ 1600
$n55 set Y_ 2551
$n55 set Z_ 0.0
$ns initial_node_pos $n55 20
set n56 [$ns node]
$n56 set X_ 1450
$n56 set Y_ 2501
$n56 set Z_ 0.0
$ns initial_node_pos $n56 20
set n57 [$ns node]
$n57 set X_ 1500
$n57 set Y_ 2501
$n57 set Z_ 0.0
$ns initial_node_pos $n57 20
set n58 [$ns node]
$n58 set X_ 1550
$n58 set Y_ 2501
$n58 set Z_ 0.0
$ns initial_node_pos $n58 20
set n59 [$ns node]
$n59 set X_ 1600
$n59 set Y_ 2501
$n59 set Z_ 0.0
$ns initial_node_pos $n59 20
set n60 [$ns node]
$n60 set X_ 1450
$n60 set Y_ 2451
$n60 set Z_ 0.0
$ns initial_node_pos $n60 20
set n61 [$ns node]
$n61 set X_ 1500
$n61 set Y_ 2451
$n61 set Z_ 0.0
$ns initial_node_pos $n61 20
set n62 [$ns node]
$n62 set X_ 1550
$n62 set Y_ 2451
$n62 set Z_ 0.0
$ns initial_node_pos $n62 20
set n63 [$ns node]
$n63 set X_ 1600
$n63 set Y_ 2451
$n63 set Z_ 0.0
$ns initial_node_pos $n63 20
set n64 [$ns node]
$n64 set X_ 1350
$n64 set Y_ 1701
$n64 set Z_ 0.0
$ns initial_node_pos $n64 20
set n65 [$ns node]
$n65 set X_ 1400
$n65 set Y_ 1701
$n65 set Z_ 0.0
$ns initial_node_pos $n65 20
set n66 [$ns node]
$n66 set X_ 1450
$n66 set Y_ 1701
$n66 set Z_ 0.0
$ns initial_node_pos $n66 20
set n67 [$ns node]
$n67 set X_ 1500
$n67 set Y_ 1701
$n67 set Z_ 0.0
$ns initial_node_pos $n67 20
set n68 [$ns node]
$n68 set X_ 1550
$n68 set Y_ 1701
$n68 set Z_ 0.0
$ns initial_node_pos $n68 20
set n69 [$ns node]
$n69 set X_ 1600
$n69 set Y_ 1701
$n69 set Z_ 0.0
$ns initial_node_pos $n69 20
set n70 [$ns node]
$n70 set X_ 1650
$n70 set Y_ 1701
$n70 set Z_ 0.0
$ns initial_node_pos $n70 20
set n71 [$ns node]
$n71 set X_ 1700
$n71 set Y_ 1701
$n71 set Z_ 0.0
$ns initial_node_pos $n71 20
set n72 [$ns node]
$n72 set X_ 1350
$n72 set Y_ 1651
$n72 set Z_ 0.0
$ns initial_node_pos $n72 20
set n73 [$ns node]
$n73 set X_ 1400
$n73 set Y_ 1651
$n73 set Z_ 0.0
$ns initial_node_pos $n73 20
set n74 [$ns node]
$n74 set X_ 1450
$n74 set Y_ 1651
$n74 set Z_ 0.0
$ns initial_node_pos $n74 20
set n75 [$ns node]
$n75 set X_ 1500
$n75 set Y_ 1651
$n75 set Z_ 0.0
$ns initial_node_pos $n75 20
set n76 [$ns node]
$n76 set X_ 1550
$n76 set Y_ 1651
$n76 set Z_ 0.0
$ns initial_node_pos $n76 20
set n77 [$ns node]
$n77 set X_ 1600
$n77 set Y_ 1651
$n77 set Z_ 0.0
$ns initial_node_pos $n77 20
set n78 [$ns node]
$n78 set X_ 1650
$n78 set Y_ 1651
$n78 set Z_ 0.0
$ns initial_node_pos $n78 20
set n79 [$ns node]
$n79 set X_ 1700
$n79 set Y_ 1651
$n79 set Z_ 0.0
$ns initial_node_pos $n79 20
set n80 [$ns node]
$n80 set X_ 1350
$n80 set Y_ 1601
$n80 set Z_ 0.0
$ns initial_node_pos $n80 20
set n81 [$ns node]
$n81 set X_ 1400
$n81 set Y_ 1601
$n81 set Z_ 0.0
$ns initial_node_pos $n81 20
set n82 [$ns node]
$n82 set X_ 1450
$n82 set Y_ 1601
$n82 set Z_ 0.0
$ns initial_node_pos $n82 20
set n83 [$ns node]
$n83 set X_ 1500
$n83 set Y_ 1601
$n83 set Z_ 0.0
$ns initial_node_pos $n83 20
set n84 [$ns node]
$n84 set X_ 1550
$n84 set Y_ 1601
$n84 set Z_ 0.0
$ns initial_node_pos $n84 20
set n85 [$ns node]
$n85 set X_ 1600
$n85 set Y_ 1601
$n85 set Z_ 0.0
$ns initial_node_pos $n85 20
set n86 [$ns node]
$n86 set X_ 1650
$n86 set Y_ 1601
$n86 set Z_ 0.0
$ns initial_node_pos $n86 20
set n87 [$ns node]
$n87 set X_ 1700
$n87 set Y_ 1601
$n87 set Z_ 0.0
$ns initial_node_pos $n87 20
set n88 [$ns node]
$n88 set X_ 1350
$n88 set Y_ 1551
$n88 set Z_ 0.0
$ns initial_node_pos $n88 20
set n89 [$ns node]
$n89 set X_ 1400
$n89 set Y_ 1551
$n89 set Z_ 0.0
$ns initial_node_pos $n89 20
set n90 [$ns node]
$n90 set X_ 1450
$n90 set Y_ 1551
$n90 set Z_ 0.0
$ns initial_node_pos $n90 20
set n91 [$ns node]
$n91 set X_ 1500
$n91 set Y_ 1551
$n91 set Z_ 0.0
$ns initial_node_pos $n91 20
set n92 [$ns node]
$n92 set X_ 1550
$n92 set Y_ 1551
$n92 set Z_ 0.0
$ns initial_node_pos $n92 20
set n93 [$ns node]
$n93 set X_ 1600
$n93 set Y_ 1551
$n93 set Z_ 0.0
$ns initial_node_pos $n93 20
set n94 [$ns node]
$n94 set X_ 1650
$n94 set Y_ 1551
$n94 set Z_ 0.0
$ns initial_node_pos $n94 20
set n95 [$ns node]
$n95 set X_ 1700
$n95 set Y_ 1551
$n95 set Z_ 0.0
$ns initial_node_pos $n95 20
set n96 [$ns node]
$n96 set X_ 1350
$n96 set Y_ 1501
$n96 set Z_ 0.0
$ns initial_node_pos $n96 20
set n97 [$ns node]
$n97 set X_ 1400
$n97 set Y_ 1501
$n97 set Z_ 0.0
$ns initial_node_pos $n97 20
set n98 [$ns node]
$n98 set X_ 1450
$n98 set Y_ 1501
$n98 set Z_ 0.0
$ns initial_node_pos $n98 20
set n99 [$ns node]
$n99 set X_ 1500
$n99 set Y_ 1501
$n99 set Z_ 0.0
$ns initial_node_pos $n99 20
set n100 [$ns node]
$n100 set X_ 1550
$n100 set Y_ 1501
$n100 set Z_ 0.0
$ns initial_node_pos $n100 20
set n101 [$ns node]
$n101 set X_ 1600
$n101 set Y_ 1501
$n101 set Z_ 0.0
$ns initial_node_pos $n101 20
set n102 [$ns node]
$n102 set X_ 1650
$n102 set Y_ 1501
$n102 set Z_ 0.0
$ns initial_node_pos $n102 20
set n103 [$ns node]
$n103 set X_ 1700
$n103 set Y_ 1501
$n103 set Z_ 0.0
$ns initial_node_pos $n103 20
set n104 [$ns node]
$n104 set X_ 1350
$n104 set Y_ 1451
$n104 set Z_ 0.0
$ns initial_node_pos $n104 20
set n105 [$ns node]
$n105 set X_ 1400
$n105 set Y_ 1451
$n105 set Z_ 0.0
$ns initial_node_pos $n105 20
set n106 [$ns node]
$n106 set X_ 1450
$n106 set Y_ 1451
$n106 set Z_ 0.0
$ns initial_node_pos $n106 20
set n107 [$ns node]
$n107 set X_ 1500
$n107 set Y_ 1451
$n107 set Z_ 0.0
$ns initial_node_pos $n107 20
set n108 [$ns node]
$n108 set X_ 1550
$n108 set Y_ 1451
$n108 set Z_ 0.0
$ns initial_node_pos $n108 20
set n109 [$ns node]
$n109 set X_ 1600
$n109 set Y_ 1451
$n109 set Z_ 0.0
$ns initial_node_pos $n109 20
set n110 [$ns node]
$n110 set X_ 1650
$n110 set Y_ 1451
$n110 set Z_ 0.0
$ns initial_node_pos $n110 20
set n111 [$ns node]
$n111 set X_ 1700
$n111 set Y_ 1451
$n111 set Z_ 0.0
$ns initial_node_pos $n111 20
set n112 [$ns node]
$n112 set X_ 1350
$n112 set Y_ 1401
$n112 set Z_ 0.0
$ns initial_node_pos $n112 20
set n113 [$ns node]
$n113 set X_ 1400
$n113 set Y_ 1401
$n113 set Z_ 0.0
$ns initial_node_pos $n113 20
set n114 [$ns node]
$n114 set X_ 1450
$n114 set Y_ 1401
$n114 set Z_ 0.0
$ns initial_node_pos $n114 20
set n115 [$ns node]
$n115 set X_ 1500
$n115 set Y_ 1401
$n115 set Z_ 0.0
$ns initial_node_pos $n115 20
set n116 [$ns node]
$n116 set X_ 1550
$n116 set Y_ 1401
$n116 set Z_ 0.0
$ns initial_node_pos $n116 20
set n117 [$ns node]
$n117 set X_ 1600
$n117 set Y_ 1401
$n117 set Z_ 0.0
$ns initial_node_pos $n117 20
set n118 [$ns node]
$n118 set X_ 1650
$n118 set Y_ 1401
$n118 set Z_ 0.0
$ns initial_node_pos $n118 20
set n119 [$ns node]
$n119 set X_ 1700
$n119 set Y_ 1401
$n119 set Z_ 0.0
$ns initial_node_pos $n119 20
set n120 [$ns node]
$n120 set X_ 1350
$n120 set Y_ 1351
$n120 set Z_ 0.0
$ns initial_node_pos $n120 20
set n121 [$ns node]
$n121 set X_ 1400
$n121 set Y_ 1351
$n121 set Z_ 0.0
$ns initial_node_pos $n121 20
set n122 [$ns node]
$n122 set X_ 1450
$n122 set Y_ 1351
$n122 set Z_ 0.0
$ns initial_node_pos $n122 20
set n123 [$ns node]
$n123 set X_ 1500
$n123 set Y_ 1351
$n123 set Z_ 0.0
$ns initial_node_pos $n123 20
set n124 [$ns node]
$n124 set X_ 1550
$n124 set Y_ 1351
$n124 set Z_ 0.0
$ns initial_node_pos $n124 20
set n125 [$ns node]
$n125 set X_ 1600
$n125 set Y_ 1351
$n125 set Z_ 0.0
$ns initial_node_pos $n125 20
set n126 [$ns node]
$n126 set X_ 1650
$n126 set Y_ 1351
$n126 set Z_ 0.0
$ns initial_node_pos $n126 20
set n127 [$ns node]
$n127 set X_ 1700
$n127 set Y_ 1351
$n127 set Z_ 0.0

$ns initial_node_pos $n127 20
set n128 [$ns node]
$n128 set X_ 949
$n128 set Y_ 1544
$n128 set Z_ 0.0

$ns initial_node_pos $n128 20
set n129 [$ns node]
$n129 set X_ 1516
$n129 set Y_ 967
$n129 set Z_ 0.0

$ns initial_node_pos $n129 20
set n130 [$ns node]
$n130 set X_ 2036
$n130 set Y_ 1537
$n130 set Z_ 0.0

$ns initial_node_pos $n130 20
set n131 [$ns node]
$n131 set X_ 1500
$n131 set Y_ 2004
$n131 set Z_ 0.0
$ns initial_node_pos $n131 20





#===================================
#        Generate movement          
#===================================
$ns at 0.1 " $n0 setdest 1450 600 48 " 
$ns at 30 " $n0 setdest 2450 1600 48 " 
$ns at 60 " $n0 setdest 1450 2600 48 " 
$ns at 90 " $n0 setdest 450 1600 48 " 

$ns at 0.1 " $n1 setdest 1500 600 48 " 
$ns at 30 " $n1 setdest 2500 1600 48 " 
$ns at 60 " $n1 setdest 1500 2600 48 " 
$ns at 90 " $n1 setdest 500 1600 48 " 

$ns at 0.1 " $n2 setdest 1550 600 48 " 
$ns at 30 " $n2 setdest 2550 1600 48 " 
$ns at 60 " $n2 setdest 1550 2600 48 " 
$ns at 90 " $n2 setdest 550 1600 48 " 

$ns at 0.1 " $n3 setdest 1600 600 48 " 
$ns at 30 " $n3 setdest 2600 1600 48 " 
$ns at 60 " $n3 setdest 1600 2600 48 " 
$ns at 90 " $n3 setdest 600 1600 48 " 

$ns at 0.1 " $n4 setdest 1450 550 48 " 
$ns at 30 " $n4 setdest 2450 1550 48 " 
$ns at 60 " $n4 setdest 1450 2550 48 " 
$ns at 90 " $n4 setdest 450 1550 48 " 

$ns at 0.1 " $n5 setdest 1500 550 48 " 
$ns at 30 " $n5 setdest 2500 1550 48 " 
$ns at 60 " $n5 setdest 1500 2550 48 " 
$ns at 90 " $n5 setdest 500 1550 48 " 

$ns at 0.1 " $n6 setdest 1550 550 48 " 
$ns at 30 " $n6 setdest 2550 1550 48 " 
$ns at 60 " $n6 setdest 1550 2550 48 " 
$ns at 90 " $n6 setdest 550 1550 48 " 

$ns at 0.1 " $n7 setdest 1600 550 48 " 
$ns at 30 " $n7 setdest 2600 1550 48 " 
$ns at 60 " $n7 setdest 1600 2550 48 " 
$ns at 90 " $n7 setdest 600 1550 48 " 

$ns at 0.1 " $n8 setdest 1450 500 48 " 
$ns at 30 " $n8 setdest 2450 1500 48 " 
$ns at 60 " $n8 setdest 1450 2500 48 " 
$ns at 90 " $n8 setdest 450 1500 48 " 

$ns at 0.1 " $n9 setdest 1500 500 48 " 
$ns at 30 " $n9 setdest 2500 1500 48 " 
$ns at 60 " $n9 setdest 1500 2500 48 " 
$ns at 90 " $n9 setdest 500 1500 48 " 

$ns at 0.1 " $n10 setdest 1550 500 48 " 
$ns at 30 " $n10 setdest 2550 1500 48 " 
$ns at 60 " $n10 setdest 1550 2500 48 " 
$ns at 90 " $n10 setdest 550 1500 48 " 

$ns at 0.1 " $n11 setdest 1600 500 48 " 
$ns at 30 " $n11 setdest 2600 1500 48 " 
$ns at 60 " $n11 setdest 1600 2500 48 " 
$ns at 90 " $n11 setdest 600 1500 48 " 

$ns at 0.1 " $n12 setdest 1450 450 48 " 
$ns at 30 " $n12 setdest 2450 1450 48 " 
$ns at 60 " $n12 setdest 1450 2450 48 " 
$ns at 90 " $n12 setdest 450 1450 48 " 

$ns at 0.1 " $n13 setdest 1500 450 48 " 
$ns at 30 " $n13 setdest 2500 1450 48 " 
$ns at 60 " $n13 setdest 1500 2450 48 " 
$ns at 90 " $n13 setdest 500 1450 48 " 

$ns at 0.1 " $n14 setdest 1550 450 48 " 
$ns at 30 " $n14 setdest 2550 1450 48 " 
$ns at 60 " $n14 setdest 1550 2450 48 " 
$ns at 90 " $n14 setdest 550 1450 48 " 

$ns at 0.1 " $n15 setdest 1600 450 48 " 
$ns at 30 " $n15 setdest 2600 1450 48 " 
$ns at 60 " $n15 setdest 1600 2450 48 " 
$ns at 90 " $n15 setdest 600 1450 48 " 

$ns at 0.1 " $n16 setdest 2450 1600 48 " 
$ns at 30 " $n16 setdest 1450 2600 48 " 
$ns at 60 " $n16 setdest 450 1600 48 " 
$ns at 90 " $n16 setdest 1450 600 48 " 

$ns at 0.1 " $n17 setdest 2500 1600 48 " 
$ns at 30 " $n17 setdest 1500 2600 48 " 
$ns at 60 " $n17 setdest 500 1600 48 " 
$ns at 90 " $n17 setdest 1500 600 48 " 

$ns at 0.1 " $n18 setdest 2550 1600 48 " 
$ns at 30 " $n18 setdest 1550 2600 48 " 
$ns at 60 " $n18 setdest 550 1600 48 " 
$ns at 90 " $n18 setdest 1550 600 48 " 

$ns at 0.1 " $n19 setdest 2600 1600 48 " 
$ns at 30 " $n19 setdest 1600 2600 48 " 
$ns at 60 " $n19 setdest 600 1600 48 " 
$ns at 90 " $n19 setdest 1600 600 48 " 

$ns at 0.1 " $n20 setdest 2450 1550 48 " 
$ns at 30 " $n20 setdest 1450 2550 48 " 
$ns at 60 " $n20 setdest 450 1550 48 " 
$ns at 90 " $n20 setdest 1450 550 48 " 

$ns at 0.1 " $n21 setdest 2500 1550 48 " 
$ns at 30 " $n21 setdest 1500 2550 48 " 
$ns at 60 " $n21 setdest 500 1550 48 " 
$ns at 90 " $n21 setdest 1500 550 48 " 

$ns at 0.1 " $n22 setdest 2550 1550 48 " 
$ns at 30 " $n22 setdest 1550 2550 48 " 
$ns at 60 " $n22 setdest 550 1550 48 " 
$ns at 90 " $n22 setdest 1550 550 48 " 

$ns at 0.1 " $n23 setdest 2600 1550 48 " 
$ns at 30 " $n23 setdest 1600 2550 48 " 
$ns at 60 " $n23 setdest 600 1550 48 " 
$ns at 90 " $n23 setdest 1600 550 48 " 

$ns at 0.1 " $n24 setdest 2450 1500 48 " 
$ns at 30 " $n24 setdest 1450 2500 48 " 
$ns at 60 " $n24 setdest 450 1500 48 " 
$ns at 90 " $n24 setdest 1450 500 48 " 

$ns at 0.1 " $n25 setdest 2500 1500 48 " 
$ns at 30 " $n25 setdest 1500 2500 48 " 
$ns at 60 " $n25 setdest 500 1500 48 " 
$ns at 90 " $n25 setdest 1500 500 48 " 

$ns at 0.1 " $n26 setdest 2550 1500 48 " 
$ns at 30 " $n26 setdest 1550 2500 48 " 
$ns at 60 " $n26 setdest 550 1500 48 " 
$ns at 90 " $n26 setdest 1550 500 48 " 

$ns at 0.1 " $n27 setdest 2600 1500 48 " 
$ns at 30 " $n27 setdest 1600 2500 48 " 
$ns at 60 " $n27 setdest 600 1500 48 " 
$ns at 90 " $n27 setdest 1600 500 48 " 

$ns at 0.1 " $n28 setdest 2450 1450 48 " 
$ns at 30 " $n28 setdest 1450 2450 48 " 
$ns at 60 " $n28 setdest 450 1450 48 " 
$ns at 90 " $n28 setdest 1450 450 48 " 

$ns at 0.1 " $n29 setdest 2500 1450 48 " 
$ns at 30 " $n29 setdest 1500 2450 48 " 
$ns at 60 " $n29 setdest 500 1450 48 " 
$ns at 90 " $n29 setdest 1500 450 48 " 

$ns at 0.1 " $n30 setdest 2550 1450 48 " 
$ns at 30 " $n30 setdest 1550 2450 48 " 
$ns at 60 " $n30 setdest 550 1450 48 " 
$ns at 90 " $n30 setdest 1550 450 48 " 

$ns at 0.1 " $n31 setdest 2600 1450 48 " 
$ns at 30 " $n31 setdest 1600 2450 48 " 
$ns at 60 " $n31 setdest 600 1450 48 " 
$ns at 90 " $n31 setdest 1600 450 48 " 

$ns at 0.1 " $n32 setdest 1450 2600 48 " 
$ns at 30 " $n32 setdest 450 1600 48 " 
$ns at 60 " $n32 setdest 1450 600 48 " 
$ns at 90 " $n32 setdest 2450 1600 48 " 

$ns at 0.1 " $n33 setdest 1500 2600 48 " 
$ns at 30 " $n33 setdest 500 1600 48 " 
$ns at 60 " $n33 setdest 1500 600 48 " 
$ns at 90 " $n33 setdest 2500 1600 48 " 

$ns at 0.1 " $n34 setdest 1550 2600 48 " 
$ns at 30 " $n34 setdest 550 1600 48 " 
$ns at 60 " $n34 setdest 1550 600 48 " 
$ns at 90 " $n34 setdest 2550 1600 48 " 

$ns at 0.1 " $n35 setdest 1600 2600 48 " 
$ns at 30 " $n35 setdest 600 1600 48 " 
$ns at 60 " $n35 setdest 1600 600 48 " 
$ns at 90 " $n35 setdest 2600 1600 48 " 

$ns at 0.1 " $n36 setdest 1450 2550 48 " 
$ns at 30 " $n36 setdest 450 1550 48 " 
$ns at 60 " $n36 setdest 1450 550 48 " 
$ns at 90 " $n36 setdest 2450 1550 48 " 

$ns at 0.1 " $n37 setdest 1500 2550 48 " 
$ns at 30 " $n37 setdest 500 1550 48 " 
$ns at 60 " $n37 setdest 1500 550 48 " 
$ns at 90 " $n37 setdest 2500 1550 48 " 

$ns at 0.1 " $n38 setdest 1550 2550 48 " 
$ns at 30 " $n38 setdest 550 1550 48 " 
$ns at 60 " $n38 setdest 1550 550 48 " 
$ns at 90 " $n38 setdest 2550 1550 48 " 

$ns at 0.1 " $n39 setdest 1600 2550 48 " 
$ns at 30 " $n39 setdest 600 1550 48 " 
$ns at 60 " $n39 setdest 1600 550 48 " 
$ns at 90 " $n39 setdest 2600 1550 48 " 

$ns at 0.1 " $n40 setdest 1450 2500 48 " 
$ns at 30 " $n40 setdest 450 1500 48 " 
$ns at 60 " $n40 setdest 1450 500 48 " 
$ns at 90 " $n40 setdest 2450 1500 48 " 

$ns at 0.1 " $n41 setdest 1500 2500 48 " 
$ns at 30 " $n41 setdest 500 1500 48 " 
$ns at 60 " $n41 setdest 1500 500 48 " 
$ns at 90 " $n41 setdest 2500 1500 48 " 

$ns at 0.1 " $n42 setdest 1550 2500 48 " 
$ns at 30 " $n42 setdest 550 1500 48 " 
$ns at 60 " $n42 setdest 1550 500 48 " 
$ns at 90 " $n42 setdest 2550 1500 48 " 

$ns at 0.1 " $n43 setdest 1600 2500 48 " 
$ns at 30 " $n43 setdest 600 1500 48 " 
$ns at 60 " $n43 setdest 1600 500 48 " 
$ns at 90 " $n43 setdest 2600 1500 48 " 

$ns at 0.1 " $n44 setdest 1450 2450 48 " 
$ns at 30 " $n44 setdest 450 1450 48 " 
$ns at 60 " $n44 setdest 1450 450 48 " 
$ns at 90 " $n44 setdest 2450 1450 48 " 

$ns at 0.1 " $n45 setdest 1500 2450 48 " 
$ns at 30 " $n45 setdest 500 1450 48 " 
$ns at 60 " $n45 setdest 1500 450 48 " 
$ns at 90 " $n45 setdest 2500 1450 48 " 

$ns at 0.1 " $n46 setdest 1550 2450 48 " 
$ns at 30 " $n46 setdest 550 1450 48 " 
$ns at 60 " $n46 setdest 1550 450 48 " 
$ns at 90 " $n46 setdest 2550 1450 48 " 

$ns at 0.1 " $n47 setdest 1600 2450 48 " 
$ns at 30 " $n47 setdest 600 1450 48 " 
$ns at 60 " $n47 setdest 1600 450 48 " 
$ns at 90 " $n47 setdest 2600 1450 48 " 

$ns at 0.1 " $n48 setdest 450 1600 48 " 
$ns at 30 " $n48 setdest 1450 600 48 " 
$ns at 60 " $n48 setdest 2450 1600 48 " 
$ns at 90 " $n48 setdest 1450 2600 48 " 

$ns at 0.1 " $n49 setdest 500 1600 48 " 
$ns at 30 " $n49 setdest 1500 600 48 " 
$ns at 60 " $n49 setdest 2500 1600 48 " 
$ns at 90 " $n49 setdest 1500 2600 48 " 

$ns at 0.1 " $n50 setdest 550 1600 48 " 
$ns at 30 " $n50 setdest 1550 600 48 " 
$ns at 60 " $n50 setdest 2550 1600 48 " 
$ns at 90 " $n50 setdest 1550 2600 48 " 

$ns at 0.1 " $n51 setdest 600 1600 48 " 
$ns at 30 " $n51 setdest 1600 600 48 " 
$ns at 60 " $n51 setdest 2600 1600 48 " 
$ns at 90 " $n51 setdest 1600 2600 48 " 

$ns at 0.1 " $n52 setdest 450 1550 48 " 
$ns at 30 " $n52 setdest 1450 550 48 " 
$ns at 60 " $n52 setdest 2450 1550 48 " 
$ns at 90 " $n52 setdest 1450 2550 48 " 

$ns at 0.1 " $n53 setdest 500 1550 48 " 
$ns at 30 " $n53 setdest 1500 550 48 " 
$ns at 60 " $n53 setdest 2500 1550 48 " 
$ns at 90 " $n53 setdest 1500 2550 48 " 

$ns at 0.1 " $n54 setdest 550 1550 48 " 
$ns at 30 " $n54 setdest 1550 550 48 " 
$ns at 60 " $n54 setdest 2550 1550 48 " 
$ns at 90 " $n54 setdest 1550 2550 48 " 

$ns at 0.1 " $n55 setdest 600 1550 48 " 
$ns at 30 " $n55 setdest 1600 550 48 " 
$ns at 60 " $n55 setdest 2600 1550 48 " 
$ns at 90 " $n55 setdest 1600 2550 48 " 

$ns at 0.1 " $n56 setdest 450 1500 48 " 
$ns at 30 " $n56 setdest 1450 500 48 " 
$ns at 60 " $n56 setdest 2450 1500 48 " 
$ns at 90 " $n56 setdest 1450 2500 48 " 

$ns at 0.1 " $n57 setdest 500 1500 48 " 
$ns at 30 " $n57 setdest 1500 500 48 " 
$ns at 60 " $n57 setdest 2500 1500 48 " 
$ns at 90 " $n57 setdest 1500 2500 48 " 

$ns at 0.1 " $n58 setdest 550 1500 48 " 
$ns at 30 " $n58 setdest 1550 500 48 " 
$ns at 60 " $n58 setdest 2550 1500 48 " 
$ns at 90 " $n58 setdest 1550 2500 48 " 

$ns at 0.1 " $n59 setdest 600 1500 48 " 
$ns at 30 " $n59 setdest 1600 500 48 " 
$ns at 60 " $n59 setdest 2600 1500 48 " 
$ns at 90 " $n59 setdest 1600 2500 48 " 

$ns at 0.1 " $n60 setdest 450 1450 48 " 
$ns at 30 " $n60 setdest 1450 450 48 " 
$ns at 60 " $n60 setdest 2450 1450 48 " 
$ns at 90 " $n60 setdest 1450 2450 48 " 

$ns at 0.1 " $n61 setdest 500 1450 48 " 
$ns at 30 " $n61 setdest 1500 450 48 " 
$ns at 60 " $n61 setdest 2500 1450 48 " 
$ns at 90 " $n61 setdest 1500 2450 48 " 

$ns at 0.1 " $n62 setdest 550 1450 48 " 
$ns at 30 " $n62 setdest 1550 450 48 " 
$ns at 60 " $n62 setdest 2550 1450 48 " 
$ns at 90 " $n62 setdest 1550 2450 48 " 

$ns at 0.1 " $n63 setdest 600 1450 48 " 
$ns at 30 " $n63 setdest 1600 450 48 " 
$ns at 60 " $n63 setdest 2600 1450 48 " 
$ns at 90 " $n63 setdest 1600 2450 48 " 


#===================================
#        Agents Definition        
#===================================
set sink0 [new Agent/TCPSink]
set sink1 [new Agent/TCPSink]
set sink2 [new Agent/TCPSink]
set sink3 [new Agent/TCPSink]
set sink4 [new Agent/TCPSink]
set sink5 [new Agent/TCPSink]
set sink6 [new Agent/TCPSink]
set sink7 [new Agent/TCPSink]

$ns attach-agent $n128 $sink0
$ns attach-agent $n129 $sink1
$ns attach-agent $n130 $sink2
$ns attach-agent $n131 $sink3
$ns attach-agent $n64 $sink4
$ns attach-agent $n65 $sink5
$ns attach-agent $n66 $sink6
$ns attach-agent $n67 $sink7


set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1
set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2
set tcp3 [new Agent/TCP]
$ns attach-agent $n3 $tcp3
set tcp4 [new Agent/TCP]
$ns attach-agent $n128 $tcp4
set tcp5 [new Agent/TCP]
$ns attach-agent $n129 $tcp5
set tcp6 [new Agent/TCP]
$ns attach-agent $n130 $tcp6
set tcp7 [new Agent/TCP]
$ns attach-agent $n131 $tcp7


#===================================
#        Applications Definition        
#===================================

set ftp0 [new Application/FTP]
$ftp0 set packetSize_ 500
$ftp0 attach-agent $tcp0
$ftp0 set type_ FTP

set ftp1 [new Application/FTP]
$ftp1 set packetSize_ 500
$ftp1 attach-agent $tcp1
$ftp1 set type_ FTP

set ftp2 [new Application/FTP]
$ftp2 set packetSize_ 500
$ftp2 attach-agent $tcp2
$ftp2 set type_ FTP

set ftp3 [new Application/FTP]
$ftp3 set packetSize_ 500
$ftp3 attach-agent $tcp3
$ftp3 set type_ FTP


set ftp4 [new Application/FTP]
$ftp4 set packetSize_ 500
$ftp4 attach-agent $tcp4
$ftp4 set type_ FTP

set ftp5 [new Application/FTP]
$ftp5 set packetSize_ 500
$ftp5 attach-agent $tcp5
$ftp5 set type_ FTP

set ftp6 [new Application/FTP]
$ftp6 set packetSize_ 500
$ftp6 attach-agent $tcp6
$ftp6 set type_ FTP

set ftp7 [new Application/FTP]
$ftp7 set packetSize_ 500
$ftp7 attach-agent $tcp7
$ftp7 set type_ FTP

$tcp0 set class_ 1
$tcp1 set class_ 2
$tcp2 set class_ 3
$tcp3 set class_ 4
$tcp4 set class_ 5
$tcp5 set class_ 6
$tcp6 set class_ 7
$tcp7 set class_ 8

$ns connect $tcp0 $sink0 
$ns connect $tcp1 $sink1
$ns connect $tcp2 $sink2
$ns connect $tcp3 $sink3

$ns connect $tcp4 $sink4
$ns connect $tcp5 $sink5
$ns connect $tcp6 $sink6
$ns connect $tcp7 $sink7




#===================================
#        Termination        
#===================================



proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}

$ns at 0.1 "$ftp0 start"
$ns at 0.1 "$ftp1 start"
$ns at 0.1 "$ftp2 start"
$ns at 0.1 "$ftp3 start"
$ns at 0.1 "$ftp4 start"
$ns at 0.1 "$ftp5 start"
$ns at 0.1 "$ftp6 start"
$ns at 0.1 "$ftp7 start"
$ns at 119 "$ftp0 stop"
$ns at 119 "$ftp1 stop"
$ns at 119 "$ftp2 stop"
$ns at 119 "$ftp3 stop"
$ns at 119 "$ftp4 stop"
$ns at 119 "$ftp5 stop"
$ns at 119 "$ftp6 stop"
$ns at 119 "$ftp7 stop"

$ns at 0.1 "$n0 add-mark m red "
$ns at 0.1 "$n1 add-mark m red "
$ns at 0.1 "$n5 add-mark m blue "
$ns at 0.1 "$n6 add-mark m blue "

$ns at 0.1 "$n64 add-mark m red "
$ns at 0.1 "$n65 add-mark m red "
$ns at 0.1 "$n73 add-mark m blue "
$ns at 0.1 "$n74 add-mark m blue "


$ns at 5 "$n5 add-mark m red "
$ns at 5 "$n6 add-mark m red "
$ns at 5 "$n7 add-mark m blue "
$ns at 5 "$n8 add-mark m blue "

$ns at 5 "$n66 add-mark m red "
$ns at 5 "$n67 add-mark m red "
$ns at 5 "$n68 add-mark m blue "
$ns at 5 "$n69 add-mark m blue "


$ns at 10.1 "$n0 add-mark m red "
$ns at 10.1 "$n1 add-mark m red "
$ns at 10.1 "$n5 add-mark m blue "
$ns at 10.1 "$n6 add-mark m blue "

$ns at 10.1 "$n64 add-mark m red "
$ns at 10.1 "$n65 add-mark m red "
$ns at 10.1 "$n73 add-mark m blue "
$ns at 10.1 "$n74 add-mark m blue "

$ns at 0.1 "$n128 add-mark m green "
$ns at 0.1 "$n129 add-mark m green "
$ns at 0.1 "$n130 add-mark m green "
$ns at 0.1 "$n131 add-mark m green "




$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"

$ns run
