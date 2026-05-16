package omnet_tictoc;
import ned.IdealChannel;

network Tictoc1
{
    double linkDelay @unit("s");
    submodules:
        tic: Txc1 {
            @display("p=112,82");
        }
        toc: Txc1 {
            @display("p=227,82");
        }

        relay: Txc1 {
            @display("p=160,141");
        }
    connections:
        tic.out --> {  delay = parent.linkDelay; } --> relay.in;
        relay.out --> {  delay = parent.linkDelay; } --> toc.in;
        toc.out --> {  delay = parent.linkDelay; } --> tic.in;
}
