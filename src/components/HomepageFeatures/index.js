import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';
import { useColorMode } from '@docusaurus/theme-common'

const FeatureList = [
  {
	scale: 3.0,
    title: 'The render management experts',
    Svg: require('@site/static/img/pfx_logo.svg').default,
    description: (
      <>
        At PipelineFX we partner with you to improve your render pipeline.
        We work hard to understand your rendering workflow and requirements,
        and offer comprehensive products and services to dramatically improve
        your rendering performance. We will offer an appropriate amount of
        installation assistance, targeted end-user and administrative software
        training and consulting services as needed. Success in digital media
        today requires maximum efficiency and we will strive to optimize your
        existing infrastructure as well as planned future expansion.
      </>
    ),
  },
];

function Feature({scale, fill, id, Svg, title, description}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
		<Svg transform={"scale(" + scale + ")"} fill={fill} id={id} className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
