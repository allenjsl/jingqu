using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;

namespace Adpost.YCH.WEB
{
    public abstract class ClientAuthorizationStartegyBase : IClientAuthorization
    {
        public string ClientId { get; set; }

        public string ClientSecret { get; set; }

        public string AuthorizationUri { get; set; }

        public string TokenUri { get; set; }

        public string API_EndpointUri { get; set; }

        protected abstract string DoGet(string accessToken = null);

        protected abstract string DoPost(HttpContent content = null, string accessToken = null);

        public string Get(string accessToken = null)
        {
            return this.DoGet(accessToken);
        }

        public string Post( HttpContent content,string accessToken=null)
        {
            return this.DoPost(content, accessToken);
        }
    }
}