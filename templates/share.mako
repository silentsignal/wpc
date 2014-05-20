--- start share ---
Share Name: ${share.get_name()}
Description: ${share.get_description()}
%if share.get_path():
Path: ${share.get_path()}
%else:
 Path: None
 %endif
Passwd: ${share.get_passwd()}
Current Uses: ${share.get_current_uses()}
Max Uses: ${share.get_max_uses()}
Permissions: ${share.get_permissions()}

%if share.get_path():
    %if f.exists():
        %if f.get_sd():
Directory Security Descriptor:
${f.get_sd().as_text()}
        %else:
Directory Security Descriptor: None (can't read sd)
        %endif
    %else:
Directory Security Descriptor: None (path doesn't exist)
    %endif
%else:
Directory Security Descriptor: None (no path)
%endif

%if share.get_sd():
Share Security Descriptor:
    ${share.get_sd().as_text()}
%else:
    Share Security Descriptor: None
%endif

--- end share ---
