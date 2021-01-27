"""helpers to read gmail oauth credentials from environment variables
"""


import os

def get_client_id(userid):
    """return the client id for a user from $CLIENT_ID_GMAIL_OAUTH
    """
    return(os.getenv('CLIENT_ID_GMAIL_OAUTH'))

def get_client_secret(userid):
    """return the client secret for a user from $CLIENT_SECRET_GMAIL_OAUTH
    """
    return(os.getenv('CLIENT_SECRET_GMAIL_OAUTH'))

def get_refresh_token(userid):
    """return the refresh token for a user from $REFRESH_TOKEN_GMAIL_OAUTH
    """
    return(os.getenv('REFRESH_TOKEN_GMAIL_OAUTH'))

def get_protonmail_userid():
    """return the refresh token for a user from $PROTONMAIL_USERNAME
    """
    return(os.getenv('PROTONMAIL_USERNAME'))
