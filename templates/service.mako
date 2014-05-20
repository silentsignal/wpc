---------------------------------------
Service:        ${svc.get_name()}
##Description:    ${svc.get_description()}
Type:           ${svc.get_type()}
Status:         ${svc.get_status()}
Startup:        ${svc.get_startup_type()}
Long Desc:      ${svc.get_long_description()}
Binary:         ${svc.get_exe_path()}
%if svc.get_exe_path_clean():
##Binary (clean): ${svc.get_exe_path_clean()}
%else:
## Binary (clean): [Missing Binary]
%endif

Run as:         ${svc.get_run_as()}
Svc Sid Type:   ${svc.get_service_sid_type()}
Failure Actions:    ${svc.get_service_config_failure_actions()}

Service Security Descriptor:
        %if svc.get_sd():
            %if flag:
${svc.get_sd().untrusted_as_text()}
            %else:
${svc.get_sd().as_text()}
            %endif
        %else:
[unknown]
        %endif

Security Descriptor for Executable:
        %if svc.get_exe_file():
            %if flag:
${svc.get_exe_file().get_sd().untrusted_as_text()}
            %else:
${svc.get_exe_file().get_sd().as_text()}
            %endif
        %else:
[unknown]
        %endif

Security Descriptor for Registry Key:
        %if svc.get_reg_key():
            %if flag:
${svc.get_reg_key().get_sd().untrusted_as_text()}
            %else:
${svc.get_reg_key().as_text()}
            %endif
        %else:
[unknown]
        %endif