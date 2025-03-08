---
sidebar_position: 1
---

# What's New in Qube!

## New In Qube! 8.0 Core / Supervisor / Worker

### PipelineFX's latest release of Qube!, version 8.0, includes:

**Additional improvements to the Qube! UI**

**Updated \"Shotgrid\" (previously \"Shotgun\") integration**

**New OS Support including:**

-   Rocky Linux

-   AlmaLinux

-   macOS latest

-   Windows 11

-   Windows Server 2022

**Python 3.9 and 3.10 API support**

**Unreal Jobtype and Unreal Engine 5.0 Movie Render Queue integration**

**Avid MediaEncoder "server" jobtype for format conversions**

**Updated job submissions**

-   After Effects 2022 and Multi-Frame Rendering

-   Autodesk Maya 2023

-   Autodesk 3dsMax 2023

-   AutoDesk VREDPro 2023

-   Maxon Cinema 4D R25

The new Qube! UI allows for several ways to view host and job data.
Users can create their own highly customizable, structured worker and
job tree views, watch multiple job or worker lists simultaneously, or
take a quick look at job status while using other applications by just
hitting a hotkey. Searching for job or worker data just became easier
through the use of new system wide variables alongside new text based
advanced filtering. Just type in a few key words, and results are
listed. And to find data quickly, the new standard expression log
bookmarking feature allows for a fast return to important log data. Job
and host management are faster, more scalable for large farms, and
easier to quickly change views as needed. Customers can upgrade and
continue seamlessly using Qube! across all portions of their pipeline.
Customizable colors and themes make the interface more comfortable to
use for any working style or preference, and there is no need to refresh
the UI to acquire job status. Real time push updates alway display the
latest information.

The Qube! UI also features the Qube! Previewer which supports sequence
playback. While previewing, users can change frame rates, choose proxy,
zoom, and pan. The new Previewer also supports all formats of OIIO with
OCIO color management..

# New In Qube! UI 8.0

For an in depth explanation of the functionality and introduction to
the new features.


:::warning[WranglerView Deprecated]
WranglerView has been replaced by the new Qube! UI, so WV will no longer
be included in any Qube! Installer package starting with version 8.0-0.
:::

See this screenshot and several others of the new Qube! UI.

<!-- \[screenshot of UI 8.0\] -->

### Highlights of the Qube! UI included in version 8.0-0:

-   Added support for After Effects Multi-Frame Rendering

-   Added a Media Encoder submission UI

-   Submission and in-app support for latest C4D releases

-   VRED jobtype Python3 compatibility

-   Added VRED support for QubeUI

-   Added Unreal Movie Render Queue submission ui

-   Updated Shotgrid integration

-   Added images to movie plugin

-   Job tags work from pulldown menu

-   Added description field to workers display

-   Added cluster field to jobs display

-   Made config on supervisor and lock schedule available from
    workercontext menu

-   Added Dependency graph

-   Added Time Graphs for frame and instance time

-   Added Windows watchdog lock/unlocking

-   Added QBConfig and config on supervisor panels

-   Filter running instances

-   Scheduled locking panel

-   Select instance from running worker context menu

-   Filter Jobs list by jobs running on selected host

-   Updated supervisorProxy to send running jobs to clients

-   Kill added to instance and running instance context menu via plugin

-   Frames resubmit plugin

-   Unbanning of hosts from the bannedHosts widget in the admin UI

-   Database admin functions added, validated on Linux. Need to check
    and update the path to the scripts for Mac and Windows

-   Added Load saved job from file option

-   Resources added to host properties

-   Added log limiting to N lines (number of lines is specified in the
    preferences for QubeUI)
