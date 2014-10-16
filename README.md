Dockerized Puppet agent
=================================

This image is for testing purpose running a Puppet Agent. It's used for testing the Puppet server https://github.com/ahmet2mir/docker-puppetserver


How to use
----------

Build

    docker build -t ahmet2mir/puppetagent .

Run 

    docker run -d -h puppetagent.local --name puppetagent ahmet2mir/puppetsagent

Enter in the container , check https://github.com/jpetazzo/nsenter

    sudo docker-enter puppetagent

Troubleshoting
----------

Trace master logs

    docker logs -f puppetserver
    
Licence 
----------

Apache 2 http://en.wikipedia.org/wiki/Apache_License

