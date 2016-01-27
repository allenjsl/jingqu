using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetOpenAuth.OAuth2;
using System.Net.Http;

namespace Adpost.YCH.WEB
{
    public class ClientCredentialsGrant : ClientAuthorizationStartegyBase
    {
        private IAuthorizationState GetAccessToken(string refresh)
        {
            var authorizationServer = new AuthorizationServerDescription
            {
                TokenEndpoint = new Uri(this.TokenUri),
                ProtocolVersion = ProtocolVersion.V20,
            };

            var client = new UserAgentClient(authorizationServer, this.ClientId, this.ClientSecret);
            IAuthorizationState ostate;
            if (refresh == null)
                ostate = client.GetClientAccessToken(new[] { this.API_EndpointUri });
            else
            {
                ostate = new AuthorizationState(new[] { this.API_EndpointUri });
                ostate.RefreshToken = refresh;
                client.RefreshAuthorization(ostate);
            }
            return ostate;
        }

        protected override string DoGet(string accessToken = null)
        {
            var state = GetAccessToken(accessToken);
            var httpClient = new OAuthHttpClient(state.AccessToken)
            {
                BaseAddress = new Uri(this.API_EndpointUri)
            };
            var response = httpClient.GetAsync("").Result;
            return response.Content.ReadAsStringAsync().Result;
        }

        protected override string DoPost(HttpContent content = null, string accessToken = null)
        {
            var state = GetAccessToken(accessToken);
            var httpClient = new OAuthHttpClient(state.AccessToken)
            {
                BaseAddress = new Uri(this.API_EndpointUri)
            };
            var response = httpClient.PostAsync("", content).Result;
            return response.Content.ReadAsStringAsync().Result;
        }
    }
}