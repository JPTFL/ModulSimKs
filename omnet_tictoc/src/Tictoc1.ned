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
        tic.out --> {  delay = 100ms; } --> relay.in;
        relay.out --> {  delay = 100ms; } --> toc.in;
        toc.out --> {  delay = 100ms; } --> tic.in;
}
