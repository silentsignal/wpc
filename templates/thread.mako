-------------------------------------------------
TID:            ${thread.get_tid()}
%if thread.get_sd():
Thread Security Descriptor: ${thread.get_sd().as_text()}
%endif

Thread Access Token:
%if thread.get_token() is not None:
    Thread token found:
        ${thread.get_token().as_text()}
%else:
    [None - thread not impersonating]
%endif