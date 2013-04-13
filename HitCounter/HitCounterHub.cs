using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HitCounter
{
    [HubName("hitcounter")]
    public class HitCounterHub : Hub
    {
        private static int _count;

        public void HitCount()
        {
            _count += 1;
            Clients.All.showHitCount(_count);
        }
    }
}