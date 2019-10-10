# IN Self Storage Computer Scripts
A collection of scripts we use to manage and maintain Windows-based computers here at IN Self Storage.

## Purpose
As with most scripts, they were born of a Systems Administrator who noticed himself/herself doing the same repetitive things over and over again, who suddenly remembered that computers are really good at doing repetitive, specific tasks. I'll spend some time in the present to make these scripts that will save me some time in the future. The intent is to create some simple, basic scripts that assist with initial setup and configuration of a fresh machine, as well as setup and configuration on a machine that's been in the field for awhile.

## Status
These are like, brand new now. I've written similar scripts in the past... but that was before I had any formal programming training, so I'm trying to build these to be more secure in their operation, and better architected. The readme file will be updated as these scripts get more complete, functional, and tested. The documentation will likely consist of this README.md file, as well as comments within the scripts. I figured I'd make these public and sufficiently generalizeable that you could use them in your environments, as well! 'Specially you 'nix admins. You probably don't want to learn CMD or PowerShell, and I already learned CMD (and am familiar with its hair-pullingly infuriating little "quirks") pretty well and am learning PowerShell, so these should aid you in your maintenance of Windows boxen.

## Scripts
This is a list of each script that I've made, and their purpose!

### Dahua Checker

#### Purpose
Dahua is a Chinese company that manufactures barely-functional surveillance cameras and network video recorders (NVRs). They're cheap, but I trust Chinese companies about as far as I'm willing to throw a stone, so I've put together a script that sets up individual user accounts on a Windows machine, each for setting up a separate, limited user account to check on a different Dahua NVR. The reason for this is two-fold:
 - One, I'm not installing Dahua software on my main machine and I want to be able to quickly spin up a VM again, and...
 - Two, an environment with multiple Dahua NVRs is going to have the most awful chimera hodgepodge of Dahua software of different (and incompatible) ActiveX controls. Since these usually install on a per-user basis, you can use Internet Explorer (gross) to manage all of your Dahua NVRs (gross) in a VM (yay!) without giving the Chinese Communist Party (gross) access to your shit.

 #### Status
 Untested.

 Also I want to add some more features, specifically, to be able to set the Internet Explorer settings (Dahua _reasonably_ asks that you, you know, turn your Internet Explorer security settings to their lowest and oh-so-politely requests that it permit the execution of executables invalid signatures, you know, no biggie) for access to these NVRs.

 Obviously, if you're using Dahua NVRs, the best solution... is to get _rid_ of them, build a decent little server, and instead use [Shinobi](https://github.com/moeiscool/Shinobi "THE open-source CCTV solution.")!