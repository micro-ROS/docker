FROM microsoft/windowsservercore:latest

ENV chocolateyUseWindowsCompression false

#COPY software C:/software

# Install chocolatey and packages
RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress; \
    choco install jre8 --version 8.0.181 -y --use-system-powershell; \
    choco install cmake python3 -y
    # choco install git --params '/GitAndUnixToolsOnPath /NoShellIntegration /NoCredentialManager /NoGitLfs /SChannel' -y
    # choco install microsoft-build-tools --version 15.0.26320.2 -y;

# Install visual studio
RUN powershell -Command iwr https://aka.ms/vs/15/release/vs_buildtools.exe -OutFile C:\vs_buildtools.exe
RUN call C:\vs_buildtools.exe --quiet --wait --norestart --nocache \
    --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended \
    --add Microsoft.VisualStudio.Component.VC.140
RUN powershell -Command Remove-Item -path C:\vs_buildtools.exe

RUN setx PATH "C:\ProgramData\chocolatey\bin;C:\Program Files (x86)\Java\jre1.8.0_181\bin;C:\Python37;C:\Program Files\Git\cmd;C:\Program Files\Git\mingw64\bin;C:\Program Files\Cmake\bin;%PATH%"
#RUN setx GTEST_ROOT "C:\software\googletest\install"
#RUN setx GMOCK_ROOT "C:\software\googletest\install"

ENTRYPOINT ["cmd", "/C", "choco", "install", "git", "--params '/GitAndUnixToolsOnPath /NoShellIntegration /NoCredentialManager /NoGitLfs /SChannel'", "-y", "&", "cmd", "/C"]


# Install OpenSSL
RUN powershell -Command iwr https://slproweb.com/download/Win64OpenSSL-1_1_1.exe -OutFile C:\Win64OpenSSL.exe; \
    iwr https://slproweb.com/download/Win32OpenSSL-1_1_1.exe -OutFile C:\Win32OpenSSL.exe
RUN  call C:\Win64OpenSSL.exe /silent /verysilent /sp- /suppressmsgboxes
RUN powershell -Command Remove-Item -path C:\Win64OpenSSL.exe
RUN  call C:\Win32OpenSSL.exe /silent /verysilent /sp- /suppressmsgboxes
RUN powershell -Command Remove-Item -path C:\Win32OpenSSL.exe
RUN setx OPENSSL64_ROOT "C:\Program Files\OpenSSL-Win64"
RUN setx OPENSSL32_ROOT "C:\Program Files (x86)\OpenSSL-Win32"
RUN setx PATH "C:\Program Files\OpenSSL-Win64;C:\Program Files (x86)\OpenSSL-Win32;%PATH%"


######################################################################################################


#> Generate Download folder
RUN mkdir C:\Downloads


#> Install chocolatey
#RUN @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"


#> Upgrade Choco repos
RUN choco upgrade chocolatey


#> Install python
RUN choco install -y python



#> Install SSL
#RUN choco install -y openssl.light 


#> Install visualstudio
#ADD https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=15# C:\Downloads\VS2017_install.exe
#COPY vs_community.exe C:\\Downloads\\VS2017_install.exe
#RUN cmd /k C:\Downloads\VS2017_install.exe --wait --norestart --nocache --all
#RUN choco install -y visualstudio2017professional
#RUN choco install -y visualstudio2017buildtools  
#RUN choco install -y visualstudio2017community


#> Install OpenCV
RUN choco install -y opencv --pre


#> Install git
RUN choco install -y git


#> Install patch
RUN choco install -y patch


#> Update the latest version of setuptools and pip
RUN python -m pip install -U setuptools pip
#RUN py -m pip install -U setuptools pip


#> Update some python dependencies for command-line tools
RUN python -m pip install -U catkin_pkg empy pyparsing pyyaml setuptools
#RUN py -m pip install -U catkin_pkg empy pyparsing pyyaml setuptools


#> Install vcstool
RUN pip install -U vcstool
#RUN py -m pip install -U vcstool


#> Install colcon
RUN pip install -U colcon-common-extensions
#RUN py -m pip install -U colcon-common-extensions


#> Install curl
RUN choco install -y curl


#> Install CMake
RUN choco install -y cmake


#> Install testing tools like pytest and others
RUN pip install -U pytest coverage mock pep257 flake8 pydocstyle
#RUN py -m pip install -U pytest coverage mock


#> Install cppcheck
RUN choco install -y cppcheck


#> Install miscellanious
RUN mkdir C:\choco_downloads
ADD https://github.com/ros2/choco-packages/releases/download/2018-06-12-1/asio.1.12.1.nupkg "C:\Downloads\asio.1.12.1.nupkg"
ADD https://github.com/ros2/choco-packages/releases/download/2018-06-12-1/eigen.3.3.4.nupkg "C:\Downloads\eigen.3.3.4.nupkg"
ADD https://github.com/ros2/choco-packages/releases/download/2018-06-12-1/tinyxml-usestl.2.6.2.nupkg "C:\Downloads\tinyxml-usestl.2.6.2.nupkg"
ADD https://github.com/ros2/choco-packages/releases/download/2018-06-12-1/tinyxml2.6.0.0.nupkg "C:\Downloads\tinyxml2.6.0.0.nupkg"
RUN choco install -y -s C:\Downloads\ asio eigen tinyxml-usestl tinyxml2


#> Configurar variables de entorno
RUN setx -m OpenCV_DIR "C:\opencv"
#RUN setx -m OPENSSL_CONF C:\OpenSSL-Win64\bin\openssl.cfg
RUN setx PATH "C:\Program Files\Cppcheck;%PATH%"
RUN setx PATH "C:\Program Files\CMake\bin;%PATH%"
RUN setx PATH "C:\opencv\x64\vc15\bin;%PATH%"
RUN setx PATH "C:\Python37\Scripts;%PATH%"
RUN setx PATH "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\Tools\;%PATH%"
#RUN setx PATH "C:\OpenSSL-Win64\bin;%PATH%"


#> Restore the default Windows shell for correct batch processing below.
#SHELL ["cmd", "/S", "/C"]


#> Configure entry point
ENTRYPOINT ["powershell"]
ENTRYPOINT ["cmd", "/K", "C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\Common7\\Tools\\VsDevCmd.bat"]

