using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;

namespace Adpost.YCH.WEB
{
    public class ClientAuthorization
    {
        private IClientAuthorization _clientAuthStrategy;
        public ClientAuthorization(IClientAuthorization clientAuthStartegy)
        {
            this._clientAuthStrategy = clientAuthStartegy;
        }

        public void ChangeStartegy(IClientAuthorization clientAuthStartegy)
        {
            this._clientAuthStrategy = clientAuthStartegy;
        }

        public string ClientId { get; set; }
        public string ClientSecret { get; set; }
        public string AuthorizationUri { get; set; }
        public string TokenUri { get; set; }
        public string API_EndpointUri { get; set; }

        public string Post(HttpContent content, string accessToken = null)
        {
            if (string.IsNullOrEmpty(_clientAuthStrategy.ClientId))
            {
                _clientAuthStrategy.ClientId = this.ClientId;
            }
            if (string.IsNullOrEmpty(_clientAuthStrategy.ClientSecret))
            {
                _clientAuthStrategy.ClientSecret = this.ClientSecret;
            }
            if (string.IsNullOrEmpty(_clientAuthStrategy.AuthorizationUri))
            {
                _clientAuthStrategy.AuthorizationUri = this.AuthorizationUri;
            }
            if (string.IsNullOrEmpty(_clientAuthStrategy.TokenUri))
            {
                _clientAuthStrategy.TokenUri = this.TokenUri;
            }
            if (string.IsNullOrEmpty(_clientAuthStrategy.API_EndpointUri))
            {
                _clientAuthStrategy.API_EndpointUri = this.API_EndpointUri;
            }
            try
            {
                return _clientAuthStrategy.Post( content,accessToken);
            }
            catch (Exception ex)
            {
                var webEx = ex.GetBaseException() as WebException;
                if (webEx != null && webEx.Status == WebExceptionStatus.ProtocolError)
                {
                    return "无效的clentid或clientsecret";
                }
                return ex.Message;
            }
        }

        public string Get(string accessToken = null)
        {
            if (string.IsNullOrEmpty(_clientAuthStrategy.ClientId))
            {
                _clientAuthStrategy.ClientId = this.ClientId;
            }
            if (string.IsNullOrEmpty(_clientAuthStrategy.ClientSecret))
            {
                _clientAuthStrategy.ClientSecret = this.ClientSecret;
            }
            if (string.IsNullOrEmpty(_clientAuthStrategy.AuthorizationUri))
            {
                _clientAuthStrategy.AuthorizationUri = this.AuthorizationUri;
            }
            if (string.IsNullOrEmpty(_clientAuthStrategy.TokenUri))
            {
                _clientAuthStrategy.TokenUri = this.TokenUri;
            }
            if (string.IsNullOrEmpty(_clientAuthStrategy.API_EndpointUri))
            {
                _clientAuthStrategy.API_EndpointUri = this.API_EndpointUri;
            }
            try
            {
                return _clientAuthStrategy.Get(accessToken);
            }
            catch(Exception ex)
            {
                var webEx =  ex.GetBaseException() as WebException;
                if (webEx != null && webEx.Status == WebExceptionStatus.ProtocolError)
                {
                    return "无效的clentid或clientsecret";
                }
                return ex.Message;
            }
        }
    }
}