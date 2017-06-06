<#--
 Copyright 2013 The Android Open Source Project

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
buildscript {
    repositories {
        jcenter()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:2.3.2'
    }
}

apply plugin: 'com.android.application'

repositories {
    jcenter()
<#if sample.repository?has_content>
<#list sample.repository as rep>
    ${rep}
</#list>
</#if>
}

dependencies {
<#if !sample.auto_add_support_lib?has_content || sample.auto_add_support_lib == "true">
  <#if sample.minSdk?matches(r'^\d+$') && sample.minSdk?number < 7>
    compile "com.android.support:support-v4:25.3.1"
    compile "com.android.support:appcompat-v7:25.3.1"
  <#elseif sample.minSdk?matches(r'^\d+$') && sample.minSdk?number < 13>
    compile "com.android.support:support-v4:25.3.1"
    compile "com.android.support:gridlayout-v7:25.3.1"
    compile "com.android.support:cardview-v7:25.3.1"
    compile "com.android.support:appcompat-v7:25.3.1"
  <#else>
    compile "com.android.support:support-v4:25.3.1"
    compile "com.android.support:support-v13:25.3.1"
    compile "com.android.support:cardview-v7:25.3.1"
    compile "com.android.support:appcompat-v7:25.3.1"
  </#if>
</#if>
<#list sample.dependency as dep>
    <#-- Output dependency after checking if it is a play services depdency and
    needs the latest version number attached. -->
    <@update_play_services_dependency dep="${dep}" />
</#list>
<#list sample.dependency_external as dep>
    compile files(${dep})
</#list>
<#if sample.wearable.has_handheld_app?has_content && sample.wearable.has_handheld_app?lower_case == "true">
    compile ${play_services_wearable_dependency}
    compile ${android_support_v13_dependency}
    wearApp project(':Wearable')
</#if>
}

// The sample build uses multiple directories to
// keep boilerplate and common code separate from
// the main sample code.
List<String> dirs = [
    'main',     // main sample code; look here for the interesting stuff.
    'common',   // components that are reused by multiple samples
    'template'] // boilerplate code that is generated by the sample template process

android {
     <#-- Note that target SDK is hardcoded in this template. We expect all samples
          to always use the most current SDK as their target. -->
    compileSdkVersion ${compile_sdk}
    buildToolsVersion ${build_tools_version}

    defaultConfig {
        minSdkVersion ${min_sdk}
      <#if sample.targetSdkVersion?? && sample.targetSdkVersion?has_content>
        targetSdkVersion ${sample.targetSdkVersion}
      <#else>
        targetSdkVersion ${compile_sdk}
      </#if>
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_7
        targetCompatibility JavaVersion.VERSION_1_7
    }

    sourceSets {
        main {
            dirs.each { dir ->
<#noparse>
                java.srcDirs "src/${dir}/java"
                res.srcDirs "src/${dir}/res"
</#noparse>
            }
        }
        androidTest.setRoot('tests')
        androidTest.java.srcDirs = ['tests/src']

<#if sample.defaultConfig?has_content>
        defaultConfig {
        ${sample.defaultConfig}
        }
<#else>
</#if>
    }

<#if sample.aapt?has_content>
    aaptOptions {
    <#list sample.aapt.noCompress as noCompress>
        noCompress "${noCompress}"
    </#list>
    }
</#if>
}
