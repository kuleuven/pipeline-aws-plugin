release: maven-release-plugin_prepare maven-release-plugin_perform

all: release hpi

maven-release-plugin_prepare:
	@mvn org.apache.maven.plugins:maven-release-plugin:prepare

maven-release-plugin_perform:
	@mvn org.apache.maven.plugins:maven-release-plugin:perform

hpi:
	mkdir -p target/classes
	@mvn org.jenkins-ci.tools:maven-hpi-plugin:hpi

spotbugs:
	@mvn spotbugs:check

.PHONY: all release
