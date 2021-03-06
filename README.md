![hugo-CI-remote](https://github.com/jkroz/hugo-blog/workflows/hugo-CI-remote/badge.svg?branch=master)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.12.0-blue.svg)

# hugo-blog

A hugo repo blog.

### 1. INFRA - Terraform

- Play the states in ./terraform folder.
- Here we are serverless infra with:
  - CDN
  - S3 (OAI used)
  - LAMBDA@EDGE
  - Optional : ACM / R53

### 2. Continuous Integration

- Add AWS AK/SK/REGION from terraform outputs to github secrets.
- Automatic build: 
  - Push on Master branch trigger a action workflow to deploy new release on CDN.
  - Actions are: 
    - Git clone own Hugo repo
    - Copy files .md & themes
    - Build Hugo
    - Deploy to AWS S3 bucket
    - Clean CDN caches
