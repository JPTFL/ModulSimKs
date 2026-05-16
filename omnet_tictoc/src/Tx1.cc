#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

class Txc1: public cSimpleModule {
public:
    int forwardCount = 0;
protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void finish() override;
};

Define_Module(Txc1);

void Txc1::initialize() {
    if (strcmp("tic", getName()) == 0) {
        cMessage *msg = new cMessage("tictocMsg");
        send(msg, "out");
    }
}

void Txc1::handleMessage(cMessage *msg) {
    ++forwardCount;
    EV << "forwardCount: " << forwardCount << endl;

    if (forwardCount >= 20){
        delete msg;
        return;
    } else {
        send(msg, "out");
    }
}

void Txc1::finish()
{
recordScalar("forwardCount", forwardCount);
}
