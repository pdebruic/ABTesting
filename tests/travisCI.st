| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

"Sample travisCI.st file:

  Edit the Metacello api and test harness invocation
  using the correct configuration name and repository 
  location.

See https://github.com/dalehenrich/filetree/blob/pharo1.4/tests/travisCI.st for example"

Metacello new
  repository: 'filetree://', gitPath, '/ABTesting/repository';
  configuration:'ABTesting';
  get.

(Smalltalk at: #ConfigurationOfABTesting) load.

"Run the tests"
TravisCIHarness
  value: #( 'ConfigurationOfABTesting' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

