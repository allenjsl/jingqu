using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;

namespace Adpost.YCH.WEB
{
    public class ClientAuthorizationCode : ClientAuthorizationStartegyBase
    {
        protected override string DoGet(string accessToken = null)
        {
            throw new NotImplementedException();
        }

        protected override string DoPost(HttpContent content = null, string accessToken = null)
        {
            throw new NotImplementedException();
        }
    }
}