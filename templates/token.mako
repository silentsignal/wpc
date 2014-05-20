--- start access token ---

Token Handle: ${int(token.get_th_int())}
%if token.get_token_owner() is not None:
Token Owner: ${token.get_token_owner().get_fq_name()}
%endif
%if token.get_token_user() is not None:
Token User: ${token.get_token_user().get_fq_name()}
%endif
%if token.get_token_primary_group() is not None:
Token Group: ${token.get_token_primary_group().get_fq_name()}
%endif
Token Type: ${token.get_token_type()}
Token Origin: ${token.get_token_origin()}
Token Source: ${token.get_token_source()}
TokenHasRestrictions: ${token.get_token_restrictions()}
TokenElevationType: ${token.get_token_elevation_type()}
TokenUIAccess: ${token.get_token_ui_access()}

##TokenLinkedToken: ${token.get_token_linked_token()}
##        if token.get_token_linked_token():
##            t += token(token.get_token_linked_token()).as_text_no_rec()
TokenLogonSid: ${token.get_token_logon_sid()}
TokenElevation: ${token.get_token_elevation()}
TokenIntegrityLevel: ${token.get_token_integrity_level().get_fq_name()}
TokenMandatoryPolicy: ${token.get_token_mandatory_policy()}

Token Resitrcted Sids:
%for sid in token.get_token_restricted_sids():
    ${sid.get_fq_name()}
%endfor

IsTokenRestricted: ${token.get_token_restricted()}

Token Groups:
%for g, attr_a in token.get_token_groups():
    ${g.get_fq_name()}: ${"|".join(attr_a)}
%endfor

Token Privileges:
%for p, a in token.get_token_privileges():
    ${p}: ${"|".join(a)}
%endfor

Token Security Descriptor:
%if token.get_sd() is not None:
${token.get_sd().as_text()}
%endif
--- end access token ---
