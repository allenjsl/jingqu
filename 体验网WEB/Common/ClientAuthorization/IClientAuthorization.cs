using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Http;

namespace Adpost.YCH.WEB
{
    public interface IClientAuthorization
    {
        string ClientId { get; set; }
        string ClientSecret { get; set; }
        string AuthorizationUri { get; set; }
        string TokenUri { get; set; }
        string API_EndpointUri { get; set; }
        string Get(string accessToken = null);
        string Post(HttpContent content, string accessToken = null);
    }
}
